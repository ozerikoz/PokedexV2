import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedexv2/screens/pokedex/components/pokemon_card.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  final FocusNode focusNode = FocusNode();

  double headerHeight = 0;

  bool orderByDescending = false;

  final ScrollController scrollController = ScrollController();

  Future<List> fetchPokeList() async {
    String jsonResponse =
        await rootBundle.loadString("assets/jsons/pokemon_summary_info.json");
    List summaryData = await json.decode(jsonResponse);

    List<Map> pokeListData = [];
    for (int i = 0; i < summaryData.length; i++) {
      pokeListData.add(summaryData[i]);
    }

    return pokeListData;
  }

  @override
  void initState() {
    fetchPokeList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPokeList(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            cacheExtent: 85,
            padding: EdgeInsets.only(top: 145),
            itemExtent: 85,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              if (orderByDescending) {
                index = snapshot.data.length - 1 - index;
              }
              return PokemonCard(
                pokeInfo: snapshot.data[index],
                index: index,
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
