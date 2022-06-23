import 'package:flutter/material.dart';
import 'package:pokedexv2/components/menu/components/buttons.dart';

class HomeMenu extends StatefulWidget {
  final int? pageIndex;
  final ValueChanged<int> onTap;

  const HomeMenu({
    Key? key,
    this.pageIndex,
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
            icon: "assets/icons/bottom_app_bar/pokeball.png",
            text: "Pokemons",
            changeIndex: widget.onTap,
            index: 0,
            pageIndex: widget.pageIndex,
          ),
          MenuButton(
            icon: "assets/icons/bottom_app_bar/moves.png",
            text: "Moves",
            changeIndex: widget.onTap,
            index: 1,
            pageIndex: widget.pageIndex,
          ),
          MenuButton(
            icon: "assets/icons/bottom_app_bar/items.png",
            text: "Items",
            changeIndex: widget.onTap,
            index: 2,
            pageIndex: widget.pageIndex,
          )
        ],
      ),
    );
  }
}
