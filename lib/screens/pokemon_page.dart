import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedexv2/components/animations/pokeball_spin.dart';
import 'package:pokedexv2/components/widgets/arrow_back.dart';
import 'package:pokedexv2/components/widgets/pokemon_panel.dart';
import 'package:pokedexv2/components/widgets/pokemon_sprite.dart';
import 'package:pokedexv2/models/pokemon_description_model.dart';
import 'package:pokedexv2/models/pokemon_model.dart';
import 'package:pokedexv2/models/specie_model.dart';
import 'package:pokedexv2/services/pokemon_infos.dart';
import 'package:pokedexv2/static/pokemon_colors.dart';

class PokemonPage extends StatefulWidget {
  final int index;

  const PokemonPage({Key? key, required this.index}) : super(key: key);
  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage>
    with TickerProviderStateMixin {
  bool isLoading = false;
  late PokemonSpecieModel specieInfo;
  late PokemonModel pokemonInfo;
  late PokemonDescriptionModel pokemonDescription;

  @override
  void initState() {
    getSpecieInfo();
    super.initState();
  }

  void getSpecieInfo() async {
    isLoading = true;

    Map<String, dynamic> specieResponse =
        await PokemonService().getPokemonSpecie(widget.index + 1);
    specieInfo = PokemonSpecieModel.fromJson(specieResponse);

    Map<String, dynamic> pokemonResponse =
        await PokemonService().getPokemon(widget.index + 1);
    pokemonInfo = PokemonModel.fromJson(pokemonResponse);

    String jsonResponse =
        await rootBundle.loadString("assets/jsons/pokemon_descriptions.json");
    List pokemonDescriptionResponse = await json.decode(jsonResponse);
    pokemonDescription = PokemonDescriptionModel.fromJson(
        pokemonDescriptionResponse[widget.index]);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              PokemonColors().pokemonTypeColor(
                type: pokemonInfo.types!.first.type!.name.toString(),
              ),
              PokemonColors()
                  .pokemonCardColor(
                    type: pokemonInfo.types!.first.type!.name.toString(),
                  )
                  .withOpacity(0.6)
            ],
            stops: const [
              0.2,
              0.8,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: SafeArea(
          child: Stack(children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.17,
              left: 0,
              right: 0,
              child: PokeballSpinAnimation(),
            ),
            PokemonPanelWidget(
              pokeInfo: pokemonInfo,
              specieInfo: specieInfo,
              pokemonDescription: pokemonDescription,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.112,
              left: 0,
              right: 0,
              child: SizedBox(
                width: 200,
                height: 200,
                child: PokemonSpriteWidget(
                  imageUrl: pokemonInfo
                      .sprites!.other!.officialArtwork!.frontDefault!,
                  defaultImageUrl: "assets/images/pokeball.png",
                ),
              ),
            ),
            ArrowBack(),
          ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
