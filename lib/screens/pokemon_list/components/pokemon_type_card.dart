import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedexv2/constants/pokemon_constants.dart';
import 'package:pokedexv2/static/pokemon_colors.dart';

class PokemonTypeCard extends StatelessWidget {
  final List<String> pokemonTypes;
  final int index;

  const PokemonTypeCard(
      {Key? key, required this.pokemonTypes, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: index == 1 ? 20 : 0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              boxShadow: [
                BoxShadow(
                  color: PokemonColors()
                      .pokemonTypeColor(type: pokemonTypes[index].toLowerCase())
                      .withOpacity(0.6),
                  blurRadius: 5,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  PokemonColors().pokemonTypeColor(
                      type: pokemonTypes[index].toLowerCase()),
                  PokemonColors()
                      .pokemonTypeColor(type: pokemonTypes[index].toLowerCase())
                      .withOpacity(0.8)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: SvgPicture.asset(
              PokemonConstants().pokemonTypeUrl +
                  "${pokemonTypes[index].toLowerCase()}.svg",
              width: 14,
            ),
          ),
        ],
      ),
    );
  }
}
