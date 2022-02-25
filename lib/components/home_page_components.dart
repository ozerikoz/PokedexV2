import 'package:flutter/material.dart';
import 'package:pokedexv2/static.dart';

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
          fillColor: Colors.grey.shade200,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: Colors.blue, width: 2)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: Colors.grey.shade200, width: 1)),
          labelText: 'What Pokemon are you looking for?',
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          labelStyle: Static().fontStyleRegular(
            15,
            Colors.grey.shade800,
          ),
        ),
      ),
    );
  }

  Widget pokemonCard(BuildContext context, index, pokeInfo) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
              left: 30, right: 30, bottom: 40, top: index == 0 ? 20 : 0),
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    spreadRadius: 0,
                    offset: Offset(0, 5))
              ]),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text("#${pokeInfo.id.toString()}"),
                Text("${pokeInfo.toString()}"),
                Row(children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 2,
                              spreadRadius: 0,
                              offset: Offset(0, 2))
                        ]),
                    child: Row(children: [
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.face,
                          size: 20,
                        ),
                      ),
                      Text(
                        "Ground",
                        style: Static().fontStyleRegular(12, Colors.black),
                      )
                    ]),
                  )
                ])
              ]),
        ),
      ],
    );
  }
}
