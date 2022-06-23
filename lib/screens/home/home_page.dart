import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pokedexv2/components/menu/menu.dart';
import 'package:pokedexv2/components/widgets/searchbar.dart';
import 'package:pokedexv2/screens/item_list/item_list.dart';
import 'package:pokedexv2/screens/move_list/move_list.dart';
import 'package:pokedexv2/screens/pokemon_list/pokemon_list.dart';
import 'package:pokedexv2/screens/splash_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  int pageIndex = 0;
  late PageController _pageController = PageController();

  @override
  void initState() {
    isLoading = true;

    Future.delayed(const Duration(milliseconds: 1600), () {
      setState(() {
        isLoading = false;
      });
    });

    _pageController = PageController(initialPage: 0, keepPage: true);
    _pageController.addListener(() {
      Future.delayed(Duration(milliseconds: 85), () {
        setState(() {
          pageIndex = _pageController.page!.toInt();
        });
      });
    });
    super.initState();
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
            body: Stack(
              children: [
                PageView(
                  controller: _pageController,
                  allowImplicitScrolling: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: const [
                    PokemonList(),
                    MoveList(),
                    ItemList(),
                  ],
                ),
                SearchBar(),
              ],
            ),
            bottomNavigationBar: HomeMenu(
              pageIndex: pageIndex,
              onTap: (newIndex) {
                _pageController.animateToPage(
                  newIndex,
                  duration: Duration(milliseconds: 100),
                  curve: Curves.linear,
                );
              },
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
