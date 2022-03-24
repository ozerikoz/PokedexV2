import 'package:flutter/material.dart';
import 'package:pokedexv2/components/menus/pokemon_panel_tabbar.dart';
import 'package:pokedexv2/components/widgets/pokemon_type_button.dart';
import 'package:pokedexv2/models/pokemon_description_model.dart';
import 'package:pokedexv2/models/pokemon_model.dart';
import 'package:pokedexv2/models/specie_model.dart';
import 'package:pokedexv2/static/text_styles.dart';
import 'package:pokedexv2/utils/text_utils.dart';

class PokemonPanelWidget extends StatelessWidget {
  final PokemonModel pokeInfo;
  final PokemonSpecieModel specieInfo;
  final PokemonDescriptionModel pokemonDescription;

  const PokemonPanelWidget({
    Key? key,
    required this.pokeInfo,
    required this.specieInfo,
    required this.pokemonDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.245,
        right: 5,
        left: 5,
      ),
      padding: EdgeInsets.only(top: 55),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Text(
                TextUtils().textCapitalize(pokeInfo.name!),
                textAlign: TextAlign.center,
                style: TextStyles().fontStyleThin(38, Colors.black),
              ),
              PokemonTypeButtonWidget(
                pokemonTypes: pokeInfo.types,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 30, bottom: 30),
                child: Text(
                  pokemonDescription.xdescription
                      .replaceAll("Pokémon", "pokemon"),
                  textAlign: TextAlign.center,
                  style: TextStyles().fontStyleRegular(14, Colors.black),
                ),
              ),
              PokemonPanelTabBar(
                firstPokemonType: pokeInfo.types!.first.type!.name!,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
