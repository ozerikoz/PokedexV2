import 'package:flutter/material.dart';
import 'package:pokedexv2/routes/route_generator.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  );
}
