import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedexv2/components/widgets/pokemon_card.dart';
import 'package:pokedexv2/components/widgets/searchbar.dart';
import 'package:pokedexv2/global.dart';
import 'package:pokedexv2/Static/text_styles.dart';
import 'package:pokedexv2/screens/splash_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  FocusNode focusNode = FocusNode();
  double headerHeight = 0;
  bool orderByDescending = false;

  ScrollController scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    isLoading = true;
    fetchPokeList();
    Future.delayed(const Duration(milliseconds: 1600), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  Future<List> fetchPokeList() async {
    String jsonResponse =
        await rootBundle.loadString("assets/jsons/pokemon_summary_info.json");
    List summaryData = await json.decode(jsonResponse);

    List<Map> pokeListData = [];
    for (int i = 0; i < summaryData.length; i++) {
      pokeListData.add(summaryData[i]);
    }
    orderByDescending
        ? pokeListData.sort(
            (b, a) => (a["number"].compareTo(b["number"])),
          )
        : pokeListData.sort(
            (b, a) => (b["number"].compareTo(a["number"])),
          );

    return pokeListData;
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isLoading,
      child: Stack(children: [
        SplashPage(),
        AnimatedOpacity(
          opacity: isLoading ? 0.0 : 1.0,
          duration: Duration(milliseconds: 1000),
          child: Scaffold(
            floatingActionButton: FloatingActionButton(onPressed: () {
              scrollController.animateTo(
                0,
                duration: Duration(milliseconds: 250),
                curve: Curves.ease,
              );
            }),
            body: GestureDetector(
              onTap: () => focusNode.unfocus(),
              child: Stack(
                children: [
                  Container(
                    color: Colors.white,
                    child: NestedScrollView(
                      controller: scrollController,
                      scrollDirection: Axis.vertical,
                      headerSliverBuilder:
                          (BuildContext context, bool innerBoxIsScrolled) {
                        return [
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
                                            style: TextStyles().fontStyleBold(
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
                                            style: TextStyles().fontStyleBold(
                                                23, Colors.black),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 100,
                                        left: 30,
                                        child: Text(
                                          "Search for Pokemon by name or using the\nPokedex number.",
                                          style: TextStyles()
                                              .fontStyleLight(14, Colors.black),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        top: 155,
                                        child: SearchBar(focusNode: focusNode),
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
                        ];
                      },
                      body: FutureBuilder(
                        future: fetchPokeList(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              cacheExtent: 148,
                              padding: EdgeInsets.zero,
                              itemExtent: 148,
                              physics: BouncingScrollPhysics(),
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return PokemonCard(
                                  pokeInfo: snapshot.data[index],
                                  index: index,
                                );
                              },
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
