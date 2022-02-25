import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pokedexv2/global.dart';
import 'package:pokedexv2/models/pokemon_model.dart';
import 'package:pokedexv2/services/base.dart';

class PokemonService extends PokemonServiceBase {
  Future<Map> getPokedex() async {
    Response response = await Dio().get(apiUrl);

    Map jsonResponse = json.decode(response.toString());

    return jsonResponse;
  }

  Future<PokemonList> getPokeList(int offSet, int limit) async {
    Response response = await Dio().get(
      baseUrl + "/pokemon",
      queryParameters: {
        "offset": offSet,
        "limit": limit,
      },
    );

    PokemonList pokelist = PokemonList.fromJson(response.data);

    // for (int i = 0; i < pokelist.result.length; i++) {
    // Pokemon().url = pokelist.result[i]["url"];
    // print(Pokemon().url);
    // }

    return pokelist;
  }

  Future<Pokemon> getPokemon(String pokeUrl, int index) async {
    Response response = await Dio().get(pokeUrl);

    Pokemon pokemon = Pokemon.fromJson(response.data);

    return pokemon;
  }
}
