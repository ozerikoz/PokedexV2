import 'package:flutter/material.dart';
import 'package:pokedexv2/Static/text_styles.dart';

class MenuButton extends StatelessWidget {
  final int? pageIndex;
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
    required this.pageIndex,
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
            Image.asset(
              icon,
              width: 24,
              cacheWidth: 24,
            ),
            const Padding(padding: EdgeInsets.only(bottom: 4)),
            Text(
              text,
              style: pageIndex == index
                  ? TextStyles().fontStyleBold(12, Colors.black)
                  : TextStyles().fontStyleLight(12, Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
