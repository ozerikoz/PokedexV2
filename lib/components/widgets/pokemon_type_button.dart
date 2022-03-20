import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedexv2/models/pokemon_model.dart';
import 'package:pokedexv2/static/pokemon_colors.dart';
import 'package:pokedexv2/static/text_styles.dart';

class PokemonTypeButtonWidget extends StatelessWidget {
  final List<Types>? pokemonTypes;

  const PokemonTypeButtonWidget({Key? key, this.pokemonTypes})
      : super(key: key);

  List<Widget> getTypeButton(pokemonTypes) {
    List<Widget> buttons = [];

    for (int i = 0; i < pokemonTypes.length; i++) {
      buttons.add(
        Container(
          height: 30,
          margin: EdgeInsets.only(left: i > 0 ? 15 : 0, top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: PokemonColors()
                      .pokemonTypeColor(
                        type: pokemonTypes![i].type!.name.toString(),
                      )
                      .withOpacity(0.8),
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ]),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              elevation: 0,
              minimumSize: const Size(0, 30),
              splashFactory: NoSplash.splashFactory,
              primary: PokemonColors().pokemonTypeColor(
                type: pokemonTypes![i].type!.name.toString(),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {},
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SvgPicture.asset(
                  "assets/icons/pokemon_types/${pokemonTypes![i].type!.name!.toLowerCase()}.svg",
                  width: 15,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 20),
                child: Text(
                  pokemonTypes![i].type!.name!.toUpperCase(),
                  style: TextStyles().fontStyleRegular(13, Colors.white),
                ),
              ),
            ]),
          ),
        ),
      );
    }
    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: getTypeButton(pokemonTypes),
    );
  }
}
