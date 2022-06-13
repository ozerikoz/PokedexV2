import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pokedexv2/screens/pokemon_details/components/pokemon_details.dart';
import 'package:pokedexv2/static/pokemon_colors.dart';
import 'package:pokedexv2/static/text_styles.dart';

class PokemonPanelTabBar extends StatefulWidget {
  final String firstPokemonType;
  final int initialIndex;

  const PokemonPanelTabBar({
    Key? key,
    required this.firstPokemonType,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  State<PokemonPanelTabBar> createState() => _PokemonPanelTabBarState();
}

class _PokemonPanelTabBarState extends State<PokemonPanelTabBar>
    with TickerProviderStateMixin {
  late TabController tabController;
  late int selectedIndex;

  @override
  void initState() {
    tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: widget.initialIndex,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 65,
      child: SizedBox(
        height: 42,
        child: TabBar(
          onTap: ((value) {
            pokemonPanelMenu(index: widget.initialIndex);
          }),
          controller: tabController,
          labelStyle: TextStyles().fontStyleRegular(14, Colors.white),
          unselectedLabelStyle: TextStyles().fontStyleRegular(14, Colors.white),
          indicatorWeight: 0,
          labelPadding: EdgeInsets.zero,
          unselectedLabelColor:
              PokemonColors().pokemonTypeColor(type: widget.firstPokemonType),
          indicator: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: PokemonColors()
                    .pokemonTypeColor(type: widget.firstPokemonType)
                    .withOpacity(0.8),
                spreadRadius: 1,
                blurRadius: 5,
              )
            ],
            borderRadius: BorderRadius.circular(30),
            color:
                PokemonColors().pokemonTypeColor(type: widget.firstPokemonType),
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
    );
  }

  pokemonPanelMenu({required int index}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      useRootNavigator: true,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width - 10,
        maxHeight: MediaQuery.of(context).size.height * 0.87,
      ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
      ),
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () {
            return Future.value(true);
          },
          child: PokemonTabDetail(
            firstPokemonType: widget.firstPokemonType,
            tabController: tabController,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
