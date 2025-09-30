//import 'package:bookly_app/core/utils/assets_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomAnimeImage extends StatelessWidget {
  const CustomAnimeImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.8/4,
        child: CachedNetworkImage(imageUrl: image,
        fit: BoxFit.fill,
        errorWidget: (context, url, error) => Icon(Icons.broken_image),
        )
      ),
    );
  }
}

