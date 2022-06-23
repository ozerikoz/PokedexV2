import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedexv2/screens/move_list/components/move_card.dart';
import 'package:pokedexv2/services/move_infos.dart';

class MoveList extends StatefulWidget {
  const MoveList({Key? key}) : super(key: key);

  @override
  State<MoveList> createState() => _MoveListState();
}

class _MoveListState extends State<MoveList> {
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
      final response = await MoveService().getMoves(pageKey);

      for (int i = 0; i < response["results"].length; i++) {
        final itemResponse =
            await MoveService().getMoveInfo(response["results"][i]["url"]);
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
        itemBuilder: (context, item, index) => MoveCard(
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
