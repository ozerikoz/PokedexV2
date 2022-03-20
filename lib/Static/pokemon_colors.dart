import 'package:flutter/material.dart';

class PokemonColors {
  Color pokemonCardColor({required String type}) {
    switch (type) {
      case 'normal':
        return Color(0xffb7b8bc);
      case 'fire':
        return Color(0xffFFA756);
      case 'water':
        return Color(0xff58ABF6);
      case 'grass':
        return Color(0xff8BBE8A);
      case 'electric':
        return Color(0xffF2CB55);
      case 'ice':
        return Color(0xff6ee5d7);
      case 'fighting':
        return Color(0xffEB4971);
      case 'poison':
        return Color(0xffb85ee5);
      case 'ground':
        return Color(0xffF88551);
      case 'flying':
        return Color(0xff84a3e0);
      case 'psychic':
        return Color(0xffff7275);
      case 'bug':
        return Color(0xff8BD674);
      case 'rock':
        return Color(0xffd3ba96);
      case 'ghost':
        return Color(0xff637cc6);
      case 'dark':
        return Color(0xff717075);
      case 'dragon':
        return Color(0xff1178d8);
      case 'steel':
        return Color(0xff5095b2);
      case 'fairy':
        return Color(0xffff84da);
      default:
        return Colors.grey;
    }
  }

  Color pokemonTypeColor({required String type}) {
    switch (type) {
      case 'normal':
        return Color(0xffA0A1A5);
      case 'fire':
        return Color(0xffFD7E25);
      case 'water':
        return Color(0xff4B91DA);
      case 'grass':
        return Color(0xff62B958);
      case 'electric':
        return Color(0xffEED537);
      case 'ice':
        return Color(0xff62CDC1);
      case 'fighting':
        return Color(0xffD44D6D);
      case 'poison':
        return Color(0xffA552CC);
      case 'ground':
        return Color(0xffDD7443);
      case 'flying':
        return Color(0xff7590C8);
      case 'psychic':
        return Color(0xffEA5D60);
      case 'bug':
        return Color(0xff8CB231);
      case 'rock':
        return Color(0xffBCA584);
      case 'ghost':
        return Color(0xff566CAE);
      case 'dark':
        return Color(0xff59585C);
      case 'dragon':
        return Color(0xff0F6AC0);
      case 'steel':
        return Color(0xff447F9A);
      case 'fairy':
        return Color(0xffEE6FC8);
      default:
        return Colors.grey;
    }
  }
}
