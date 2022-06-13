import 'package:flutter/material.dart';
import 'package:pokedexv2/static/pokemon_colors.dart';
import 'package:pokedexv2/static/text_styles.dart';

class PokemonTabDetail extends StatelessWidget {
  final String firstPokemonType;
  final TabController tabController;
  const PokemonTabDetail(
      {Key? key, required this.tabController, required this.firstPokemonType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 42,
            child: Theme(
              data: ThemeData(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
              child: TabBar(
                controller: tabController,
                labelStyle: TextStyles().fontStyleRegular(14, Colors.white),
                unselectedLabelStyle:
                    TextStyles().fontStyleRegular(14, Colors.white),
                indicatorWeight: 0,
                labelPadding: EdgeInsets.zero,
                unselectedLabelColor:
                    PokemonColors().pokemonTypeColor(type: firstPokemonType),
                indicator: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: PokemonColors()
                          .pokemonTypeColor(type: firstPokemonType)
                          .withOpacity(0.8),
                      spreadRadius: 1,
                      blurRadius: 5,
                    )
                  ],
                  borderRadius: BorderRadius.circular(30),
                  color:
                      PokemonColors().pokemonTypeColor(type: firstPokemonType),
                ),
                labelColor: Colors.white,
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("stats".toUpperCase()),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("evolutions".toUpperCase()),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("moves".toUpperCase()),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                Text("data"),
                Text("data"),
                Text("data"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
