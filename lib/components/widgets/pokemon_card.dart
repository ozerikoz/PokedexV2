import 'package:flutter/material.dart';
import 'package:pokedexv2/Static/pokemon_colors.dart';
import 'package:pokedexv2/components/pokemon_type_card.dart';
import 'package:pokedexv2/components/widgets/pokemon_sprite.dart';
import 'package:pokedexv2/Static/text_styles.dart';
import 'package:pokedexv2/models/pokemon_summary_model.dart';
import 'package:pokedexv2/utils/text_utils.dart';

class PokemonCard extends StatelessWidget {
  final Map<String, dynamic> pokeInfo;
  final int index;

  const PokemonCard({Key? key, required this.pokeInfo, required this.index})
      : super(key: key);

  List<Widget> pokemonTypeButton(List<String>? summaryTypes) {
    List<Widget> buttons = [];

    for (int i = 0; i < summaryTypes!.length; i++) {
      buttons.add(PokemonTypeCard(pokemonTypes: summaryTypes, index: i));
    }
    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    PokemonSummaryModel pokemon = PokemonSummaryModel.fromJson(pokeInfo);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "pokemonPage", arguments: index);
      },
      child: Stack(
        children: <Widget>[
          Container(
            margin:
                const EdgeInsets.only(left: 30, right: 30, bottom: 10, top: 20),
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: PokemonColors()
                  .pokemonCardColor(type: pokemon.types.first.toLowerCase())!,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "#${pokemon.number}",
                  style: TextStyles().fontStyleBold(12, Colors.black54),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    TextUtils().textCapitalize(
                      pokemon.name.toString(),
                    ),
                    strutStyle: StrutStyle(forceStrutHeight: true),
                    style: TextStyles().fontStyleBold(22, Colors.white),
                  ),
                ),
                Row(
                  children: pokemonTypeButton(pokemon.types),
                ),
              ],
            ),
          ),
          Positioned(
              top: 0,
              bottom: 0,
              right: 40,
              child: PokemonSpriteWidget(
                  imageUrl: pokemon.imageUrl,
                  defaultImageUrl: "assets/images/pokeball.png")),
        ],
      ),
    );
  }
}
