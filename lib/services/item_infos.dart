import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedexv2/services/base.dart';
import 'package:pokedexv2/services/pokemon_infos.dart';

class ItemService extends PokemonServiceBase {
  Future getItems(int offSet, int limit) async {
    Response response = await Dio().get(
      PokemonServiceBase().apiUrl + "/item/",
      queryParameters: {
        "offset": offSet,
        "limit": limit,
      },
    );

    Map jsonResponse = json.decode(response.toString());

    return jsonResponse;
  }

  Future getItemInfo(int index) async {
    Response response =
        await Dio().get("${PokemonService().apiUrl}item/$index/");

    Map jsonResponse = json.decode(response.toString());

    return jsonResponse;
  }
}
