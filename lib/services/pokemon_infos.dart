import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pokedexv2/services/base.dart';

class PokemonService extends PokemonServiceBase {
  Future getPokemons(int offSet, int limit) async {
    Response response = await Dio().get(
      PokemonServiceBase().apiUrl + "/pokemon",
      queryParameters: {
        "offset": offSet,
        "limit": limit,
      },
    );

    Map jsonResponse = json.decode(response.toString());

    return jsonResponse;
  }

  Future getPokemonSpecie(int index) async {
    Response response =
        await Dio().get("${PokemonService().apiUrl}pokemon-species/$index");

    Map jsonResponse = json.decode(response.toString());

    return jsonResponse;
  }

  Future getPokemon(int index) async {
    Response response =
        await Dio().get("${PokemonService().apiUrl}pokemon/$index");

    Map jsonResponse = json.decode(response.toString());

    return jsonResponse;
  }
}
