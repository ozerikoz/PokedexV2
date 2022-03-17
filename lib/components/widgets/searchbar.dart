import 'package:flutter/material.dart';
import 'package:pokedexv2/static/text_styles.dart';

class SearchBar extends StatelessWidget {
  final FocusNode focusNode;
  const SearchBar({Key? key, required this.focusNode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: TextField(
        onChanged: (value) {},
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
}
