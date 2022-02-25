import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedexv2/components/home_page_components.dart';
import 'package:pokedexv2/global.dart';
import 'package:pokedexv2/models/pokemon_model.dart';
import 'package:pokedexv2/services/pokemon.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedexv2/static.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FocusNode focusNode = FocusNode();
  double headerHeight = 0;
  bool orderByDescending = false;
  bool loading = false;
  late Pokemon pokemon;
  late final newItems = [];

  // Paging variables
  static const int _pageSize = 20;
  static const int _pageLimit = _pageSize;
  final PagingController _pagingController = PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((offset) {
      _fetchPage(offset);
    });
    getPokemonInfo(newItems);
    super.initState();
  }

  Future<void> _fetchPage(int offSet) async {
    if (offSet != 0) {
      await Future.delayed(Duration(seconds: 1));
    }
    try {
      final newItems = await PokemonService().getPokeList(offSet, _pageLimit);
      getPokemonInfo(newItems.result);
      final isLastPage = newItems.result.length < _pageSize;
      final nextPageKey = offSet + _pageSize;
      _pageLimit + _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems.result);
      } else {
        _pagingController.appendPage(newItems.result, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
    print(Pokemon().url);
  }

  Future<void> getPokemonInfo(List<dynamic> pokemonList) async {
    for (int i = 0; i < pokemonList.length; i++) {}
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Container()
        : Scaffold(
            body: GestureDetector(
              onTap: () => focusNode.unfocus(),
              child: Stack(
                children: [
                  Container(
                    color: Colors.white,
                    child: CustomScrollView(
                        scrollDirection: Axis.vertical,
                        slivers: [
                          SliverAppBar(
                            pinned: true,
                            elevation: 0,
                            backgroundColor: Colors.white,
                            actionsIconTheme: IconThemeData(opacity: 0.0),
                            expandedHeight: 225,
                            collapsedHeight: 70,
                            automaticallyImplyLeading: false,
                            flexibleSpace: LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                headerHeight = constraints.biggest.height;

                                return SafeArea(
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: 20,
                                        left: 30,
                                        child: AnimatedOpacity(
                                          opacity: headerHeight < 155 ? 1 : 0,
                                          duration: headerHeight < 155
                                              ? Duration(milliseconds: 500)
                                              : Duration.zero,
                                          child: Text(
                                            "Pokedex",
                                            style: Static().fontStyleBold(
                                                20, Colors.black),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 65,
                                        left: 30,
                                        child: AnimatedOpacity(
                                          opacity: headerHeight > 155 ? 1 : 0,
                                          duration: headerHeight > 155
                                              ? Duration(milliseconds: 500)
                                              : Duration.zero,
                                          child: Text(
                                            "Pokedex",
                                            style: Static().fontStyleBold(
                                                23, Colors.black),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 100,
                                        left: 30,
                                        child: Text(
                                          "Search for Pokemon by name or using the\nPokedex number.",
                                          style: Static()
                                              .fontStyleLight(14, Colors.black),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        top: 155,
                                        child: HomePageComponents()
                                            .homeSearchBar(context, focusNode),
                                      ),
                                      Positioned(
                                        top: 10,
                                        right: 30,
                                        child: Row(children: [
                                          IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {
                                              setState(() {
                                                darkTheme = !darkTheme;
                                              });
                                            },
                                            icon: Icon(
                                              darkTheme
                                                  ? Icons.light_mode_outlined
                                                  : Icons.dark_mode_outlined,
                                              size: 25,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 25),
                                            child: GestureDetector(
                                              onTap: (() {
                                                setState(() {
                                                  orderByDescending =
                                                      !orderByDescending;
                                                });
                                              }),
                                              child: SvgPicture.asset(
                                                "assets/icons/${orderByDescending ? "order_descending.svg" : "order_ascending.svg"}",
                                                width: 25,
                                              ),
                                            ),
                                          ),
                                          SvgPicture.asset(
                                            'assets/icons/sort2.svg',
                                            width: 22,
                                          ),
                                        ]),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Theme(
                              data: ThemeData(backgroundColor: Colors.white),
                              child: createListView(),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          );
  }

  Widget createListView() {
    ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {}
    });
    return RefreshIndicator(
        onRefresh: (() => Future.sync(() => _pagingController.refresh())),
        child: PagedListView(
          shrinkWrap: true,
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (context, item, index) {
              return HomePageComponents().pokemonCard(context, index, item);
            },
          ),
          scrollController: scrollController,
          pagingController: _pagingController,
        ));
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
