import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pokedexv2/components/menu/menu.dart';
import 'package:pokedexv2/components/widgets/searchbar.dart';
import 'package:pokedexv2/screens/home/item_list.dart';
import 'package:pokedexv2/screens/pokemon_list/pokemon_list.dart';
import 'package:pokedexv2/screens/splash_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  final PageController _pageController = PageController();

  @override
  void initState() {
    isLoading = true;

    Future.delayed(const Duration(milliseconds: 1600), () {
      setState(() {
        isLoading = false;
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
            bottomNavigationBar: HomeMenu(
              onTap: (newIndex) {
                _pageController.animateToPage(
                  newIndex,
                  duration: Duration(milliseconds: 100),
                  curve: Curves.linear,
                );
              },
            ),
            body: Stack(
              children: [
                PageView(
                  controller: _pageController,
                  physics: NeverScrollableScrollPhysics(),
                  children: const [
                    PokemonList(),
                    Icon(Icons.access_time_filled_rounded),
                    Icon(Icons.add_a_photo_outlined),
                    ItemList(),
                  ],
                ),
                SearchBar(),
              ],
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
