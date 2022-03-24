import 'dart:async';
import 'package:flutter/material.dart';

StreamController<bool> streamController = StreamController.broadcast();

class ArrowBack extends StatefulWidget {
  final Stream<bool> stream;
  const ArrowBack(
    this.stream, {
    Key? key,
  }) : super(key: key);

  @override
  State<ArrowBack> createState() => _ArrowBackState();
}

class _ArrowBackState extends State<ArrowBack> {
  int value = 0;
  @override
  void initState() {
    widget.stream.asBroadcastStream().listen((pokemonDetailsOpen) {
      pokemonDetailsOpen ? value = 3 : value = 0;
      if (mounted) {
        setState(() {
          arrowBack(value);
        });
      }
    });
    super.initState();
  }

  Widget arrowBack(int value) {
    return RotatedBox(
      quarterTurns: value,
      child: IconButton(
        padding: EdgeInsets.only(top: 10),
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return arrowBack(value);
  }
}
