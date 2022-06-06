import 'package:flutter/material.dart';
import 'package:pokedexv2/screens/home/home_page.dart';
import 'package:pokedexv2/screens/pokemon/pokemon_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => HomePage());

      case "pokemonPage":
        if (args is int) {
          return MaterialPageRoute(
            builder: (_) => PokemonPage(
              index: args,
            ),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Text("error"),
      );
    });
  }
}
