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
        await Dio().get("https://pokeapi.co/api/v2/pokemon-species/$index");

    Map jsonResponse = json.decode(response.toString());

    return jsonResponse;
  }

  Future getPokemon(String pokeUrl) async {
    Response response = await Dio().get(pokeUrl);

    Map jsonResponse = json.decode(response.toString());

    return jsonResponse;
  }
}
