import 'package:flutter/material.dart';
import 'package:pokedexv2/Static/text_styles.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          height: 140,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [
                Colors.white,
                Colors.green,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Pokemon",
                  style: TextStyles().fontStyleBold(18, Colors.black),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: TextField(
                    maxLines: 1,
                    style: TextStyles().fontStyleRegular(16, Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      suffixIcon: Icon(
                        Icons.mic,
                        color: Colors.black,
                      ),
                      prefixIconConstraints: BoxConstraints(maxWidth: 24),
                      suffixIconConstraints: BoxConstraints(maxWidth: 24),
                      hintText: " Search",
                      hintStyle: TextStyles().fontStyleLight(16, Colors.black),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(bottom: 5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.black,
          height: 5,
        ),
      ],
    );
  }
}
