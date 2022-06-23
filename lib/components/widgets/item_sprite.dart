import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemSpriteWidget extends StatelessWidget {
  final String imageUrl;
  final double imageWidth;
  final String defaultImageUrl;
  final double defaultImageWidth;

  const ItemSpriteWidget({
    Key? key,
    required this.imageUrl,
    this.imageWidth = 60,
    required this.defaultImageUrl,
    this.defaultImageWidth = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fadeInDuration: const Duration(milliseconds: 250),
      imageUrl: imageUrl,
      width: imageWidth,
      placeholder: (context, url) => Image.asset(
        "assets/images/pokeball.png",
        cacheWidth: defaultImageWidth.toInt(),
        width: defaultImageWidth,
      ),
      errorWidget: (context, url, error) => Image.asset(
        "assets/images/pokeball.png",
        cacheWidth: defaultImageWidth.toInt(),
        width: defaultImageWidth,
      ),
    );
  }
}
