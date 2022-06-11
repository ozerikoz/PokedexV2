import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedexv2/Static/text_styles.dart';

class MenuButton extends StatelessWidget {
  final String icon;
  final String text;
  final ValueChanged<int> changeIndex;
  final int index;

  const MenuButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.changeIndex,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: RawMaterialButton(
        onPressed: () {
          changeIndex.call(index);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              width: 24,
            ),
            Text(
              text.toUpperCase(),
              style: TextStyles().fontStyleLight(12, Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
