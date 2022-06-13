import 'package:flutter/material.dart';
import 'package:pokedexv2/Static/pokemon_colors.dart';
import 'package:pokedexv2/components/widgets/pokemon_sprite.dart';
import 'package:pokedexv2/Static/text_styles.dart';
import 'package:pokedexv2/models/pokemon_summary_model.dart';
import 'package:pokedexv2/screens/pokedex/components/pokemon_type_card.dart';
import 'package:pokedexv2/utils/text_utils.dart';

class PokemonCard extends StatelessWidget {
  final Map<String, dynamic> pokeInfo;
  final int index;

  const PokemonCard({Key? key, required this.pokeInfo, required this.index})
      : super(key: key);

  List<Widget> pokemonTypeButton(List<String>? summaryTypes) {
    List<Widget> typeCards = [];

    for (int i = 0; i < summaryTypes!.length; i++) {
      typeCards.add(
        PokemonTypeCard(
          pokemonTypes: summaryTypes,
          index: i,
        ),
      );
    }
    return typeCards;
  }

  @override
  Widget build(BuildContext context) {
    PokemonSummaryModel pokemon = PokemonSummaryModel.fromJson(pokeInfo);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          "pokemonPage",
          arguments: index,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                PokemonSpriteWidget(
                  imageUrl: pokemon.imageUrl,
                  defaultImageUrl: "assets/images/pokeball.png",
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        TextUtils().textCapitalize(
                          pokemon.name.toString(),
                        ),
                        strutStyle: StrutStyle(forceStrutHeight: true),
                        style: TextStyles().fontStyleRegular(16, Colors.black),
                      ),
                    ),
                    Text(
                      "#${pokemon.number}",
                      style: TextStyles().fontStyleLight(12, Colors.black54),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: pokemonTypeButton(pokemon.types),
            ),
          ],
        ),
      ),
    );
  }
}
