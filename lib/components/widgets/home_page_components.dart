import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedexv2/Static/pokemon_colors.dart';
import 'package:pokedexv2/constants/pokemon_constants.dart';
import 'package:pokedexv2/Static/text_styles.dart';
import 'package:pokedexv2/models/pokemon_summary_model.dart';
import 'package:pokedexv2/utils/text_utils.dart';

class HomePageComponents {
  Widget homeSearchBar(BuildContext context, FocusNode focusNode) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: TextField(
        focusNode: focusNode,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: true,
          fillColor: Color(0xffF4F5F5),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: Color(0xffF4F5F5), width: 2)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Color(0xffF4F5F5), width: 1),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: Color(0xffF4F5F5), width: 1)),
          labelText: 'What Pokemon are you looking for?',
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          labelStyle: TextStyles().fontStyleRegular(
            15,
            Colors.grey.shade800,
          ),
        ),
      ),
    );
  }

  List<Widget> pokemonTypeButton(List<String>? summaryTypes) {
    List<Widget> buttons = [];

    for (int i = 0; i < summaryTypes!.length; i++) {
      buttons.add(
        Container(
          margin: EdgeInsets.only(right: i == 0 ? 10 : 0),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: PokemonColors()
                .pokemonTypeColor(type: summaryTypes[i].toLowerCase())!,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                PokemonConstants().pokemonTypeUrl +
                    "${summaryTypes[i].toLowerCase()}.svg",
                width: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  TextUtils().textCapitalize(summaryTypes[i]),
                  style: TextStyles().fontStyleRegular(12, Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return buttons;
  }

  Widget pokemonCard({context, pokeInfo, index}) {
    PokemonSummary pokemon = PokemonSummary.fromJson(pokeInfo);

    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 30, right: 30, bottom: 10, top: 20),
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: PokemonColors()
                .pokemonCardColor(type: pokemon.types[0].toLowerCase())!,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "#${pokemon.number}",
                  style: TextStyles().fontStyleBold(12, Colors.black54),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    TextUtils().textCapitalize(
                      pokemon.name.toString(),
                    ),
                    strutStyle: StrutStyle(forceStrutHeight: true),
                    style: TextStyles().fontStyleBold(22, Colors.white),
                  ),
                ),
                Row(
                  children: pokemonTypeButton(pokemon.types),
                ),
              ]),
        ),
        Positioned(
          right: 40,
          child: CachedNetworkImage(
            imageUrl: pokemon.imageUrl,
            width: 125,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ],
    );
  }
}
