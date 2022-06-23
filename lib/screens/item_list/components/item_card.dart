import 'package:flutter/material.dart';
import 'package:pokedexv2/components/widgets/item_sprite.dart';
import 'package:pokedexv2/models/item_model.dart';
import 'package:pokedexv2/screens/item_details/item_details.dart';
import 'package:pokedexv2/static/text_styles.dart';
import 'package:pokedexv2/utils/text_utils.dart';

class ItemCard extends StatelessWidget {
  final Map<String, dynamic> itemInfo;
  final int index;

  const ItemCard({Key? key, required this.itemInfo, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemModel item = ItemModel.fromJson(itemInfo);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemScreen(
              index: index,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                ItemSpriteWidget(
                  imageUrl: item.image,
                  defaultImageUrl: "assets/images/pokeball.png",
                ),
                Text(
                  TextUtils().textCapitalize(
                    item.name.replaceAll("-", " ").toString(),
                  ),
                  strutStyle: StrutStyle(forceStrutHeight: true),
                  style: TextStyles().fontStyleRegular(16, Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  item.cost.toString(),
                  style: TextStyles().fontStyleRegular(14, Colors.black),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5),
                ),
                Image.asset(
                  "assets/icons/cost.png",
                  width: 10,
                  cacheWidth: 10,
                  fit: BoxFit.contain,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
