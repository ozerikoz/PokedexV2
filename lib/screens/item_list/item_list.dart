import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedexv2/screens/item_list/components/item_card.dart';
import 'package:pokedexv2/services/item_infos.dart';

class ItemList extends StatefulWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  static const _pageSize = 15;
  final PagingController<int, dynamic> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      fetchItemList(pageKey);
    });
    super.initState();
  }

  void fetchItemList(int pageKey) async {
    List<Map> newItems = [];
    try {
      final response = await ItemService().getItems(pageKey);

      for (int i = 0; i < response["results"].length; i++) {
        final itemResponse =
            await ItemService().getItemInfo(response["results"][i]["url"]);
        newItems.add(itemResponse);
      }

      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey.toInt());
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, dynamic>(
      padding: EdgeInsets.only(top: 145),
      pagingController: _pagingController,
      itemExtent: 85,
      cacheExtent: 85,
      builderDelegate: PagedChildBuilderDelegate<dynamic>(
        itemBuilder: (context, item, index) => ItemCard(
          index: index,
          itemInfo: item,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
