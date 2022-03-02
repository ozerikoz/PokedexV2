import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedexv2/global.dart';
import 'package:pokedexv2/services/base.dart';

class PokemonService extends PokemonServiceBase {
  Future getPokemons(int offSet) async {
    Response response = await Dio().get(
      baseUrl + "/pokemon",
      queryParameters: {
        "offset": offSet,
      },
    );

    Map jsonResponse = json.decode(response.toString());

    return jsonResponse;
  }

  Future getPokeSpecie(String pokeSpecieUrl) async {
    Response response = await Dio().get(pokeSpecieUrl);

    Map jsonResponse = json.decode(response.toString());

    return jsonResponse;
  }

  Future getPokemon(String pokeUrl) async {
    Response response = await Dio().get(pokeUrl);

    Map jsonResponse = json.decode(response.toString());

    return jsonResponse;
  }
}
