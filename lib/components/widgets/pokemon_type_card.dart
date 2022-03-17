import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedexv2/constants/pokemon_constants.dart';
import 'package:pokedexv2/static/pokemon_colors.dart';
import 'package:pokedexv2/static/text_styles.dart';
import 'package:pokedexv2/utils/text_utils.dart';

class PokemonTypeCard extends StatelessWidget {
  final List<String> pokemonTypes;
  final int index;

  const PokemonTypeCard(
      {Key? key, required this.pokemonTypes, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(right: index == 0 ? 10 : 0),
      color: PokemonColors()
          .pokemonTypeColor(type: pokemonTypes[index].toLowerCase())!,
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              PokemonConstants().pokemonTypeUrl +
                  "${pokemonTypes[index].toLowerCase()}.svg",
              width: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                TextUtils().textCapitalize(pokemonTypes[index]),
                style: TextStyles().fontStyleRegular(12, Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
