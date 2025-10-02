import 'package:anime_app/core/utils/styles.dart';
import 'package:anime_app/features/favorit/data/models/fav_anime_model.dart';
import 'package:anime_app/features/home/presentation/widgets/custom_anime_image.dart';
import 'package:flutter/material.dart';

class FavItem extends StatelessWidget {
  const FavItem({super.key, required this.favAnimeModel});
  final FavAnimeModel favAnimeModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          // الصورة تاخد المساحة المتاحة بشكل متناسق
          child: CustomAnimeImage(image: favAnimeModel.imageUrl),
        ),
        const SizedBox(height: 8),
        Text(
          favAnimeModel.titleEnglish,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(favAnimeModel.status, style: Styles.textStyle10),
            Icon(Icons.star, color: Colors.amber, size: 15),
            Text("${favAnimeModel.rate}", style: Styles.textStyle10),
          ],
        ),
      ],
    );
  }
}
