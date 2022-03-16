import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pokedexv2/models/specie_model.dart';
import 'package:pokedexv2/services/pokemon_infos.dart';

class PokemonPage extends StatefulWidget {
  final int index;

  const PokemonPage({Key? key, required this.index}) : super(key: key);
  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  bool isLoading = false;
  late PokemonSpecieModel pokemon;
  @override
  void initState() {
    getSpecieInfo();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
    super.initState();
  }

  void getSpecieInfo() async {
    isLoading = true;
    final specieInfo =
        await PokemonService().getPokemonSpecie(widget.index + 1);
    pokemon = PokemonSpecieModel.fromJson(specieInfo);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade900,
              Colors.blue.shade300,
            ],
            stops: const [
              0.0,
              0.8,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: SafeArea(
          child: Stack(children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05),
              child: Align(
                alignment: Alignment.topCenter,
                child: RotationTransition(
                  turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                  child: Image.asset(
                    "assets/images/background-pokeball.png",
                    cacheWidth: 180,
                    opacity: AlwaysStoppedAnimation<double>(0.1),
                  ),
                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 3,
                sigmaY: 3,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.1),
                      Colors.white.withOpacity(0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.3),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50)),
                  ),
                  child: Text(pokemon.name),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
            ),
          ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
