import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pokedexv2/services/base.dart';

class MoveService extends PokemonServiceBase {
  Future getMoves(int offSet) async {
    Response response = await Dio().get(
      PokemonServiceBase().apiUrl + "/move/",
      queryParameters: {
        "offset": offSet,
      },
    );

    Map jsonResponse = json.decode(response.toString());

    return jsonResponse;
  }

  Future getMoveInfo(String url) async {
    Response response = await Dio().get(url);

    Map jsonResponse = json.decode(response.toString());

    return jsonResponse;
  }
}
