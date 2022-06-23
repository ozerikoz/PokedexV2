import 'package:flutter/material.dart';
import 'package:pokedexv2/models/move_model.dart';
import 'package:pokedexv2/screens/move_details/move_details.dart';
import 'package:pokedexv2/screens/pokemon_list/components/pokemon_type_card.dart';
import 'package:pokedexv2/static/text_styles.dart';
import 'package:pokedexv2/utils/text_utils.dart';

class MoveCard extends StatelessWidget {
  final Map<String, dynamic> itemInfo;
  final int index;

  const MoveCard({Key? key, required this.itemInfo, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoveModel move = MoveModel.fromJson(itemInfo);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MoveScreen(
              index: index,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              TextUtils().textCapitalize(
                move.name!.replaceAll("-", " ").toString(),
              ),
              strutStyle: StrutStyle(forceStrutHeight: true),
              style: TextStyles().fontStyleRegular(16, Colors.black),
            ),
            PokemonTypeCard(
              pokemonTypes: [move.type!],
              index: 0,
            ),
          ],
        ),
      ),
    );
  }
}
