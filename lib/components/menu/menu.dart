import 'package:flutter/material.dart';
import 'package:pokedexv2/components/menu/components/buttons.dart';

class HomeMenu extends StatefulWidget {
  final ValueChanged<int> onTap;

  const HomeMenu({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: MediaQuery.of(context).size.width,
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MenuButton(
            icon: "assets/icons/bottom_app_bar/pokeball.svg",
            text: "pokemons",
            changeIndex: widget.onTap,
            index: 0,
          ),
          MenuButton(
            icon: "assets/icons/bottom_app_bar/types.svg",
            text: "types",
            changeIndex: widget.onTap,
            index: 1,
          ),
          MenuButton(
            icon: "assets/icons/bottom_app_bar/battle.svg",
            text: "abilities",
            changeIndex: widget.onTap,
            index: 2,
          ),
          MenuButton(
            icon: "assets/icons/bottom_app_bar/items.svg",
            text: "items",
            changeIndex: widget.onTap,
            index: 3,
          )
        ],
      ),
    );
  }
}
