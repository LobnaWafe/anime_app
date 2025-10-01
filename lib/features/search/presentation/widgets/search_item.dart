
import 'package:anime_app/core/utils/styles.dart';
import 'package:anime_app/features/home/data/models/anime_model/anime_model.dart';
import 'package:anime_app/features/home/presentation/widgets/custom_anime_image.dart';
import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.animeModel});
  final AnimeModel animeModel;
  @override
  Widget build(BuildContext context) {
    return Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    SizedBox(
      width: 100,
      child: CustomAnimeImage(
        image: animeModel.images!.jpg!.imageUrl!,
      ),
    ),

    const SizedBox(width: 10),

    // هنا نضيف Expanded علشان النص يتقيد بالعرض
    Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             animeModel.titleEnglish!=null ?animeModel.titleEnglish! : "",
              style: Styles.textStyle18,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(animeModel.status !=null ?animeModel.status!:"no data", style: Styles.textStyle11),
                const Icon(Icons.star, color: Colors.amber, size: 14),
                Text(animeModel.score !=null ? "${animeModel.score!}" :"no data", style: Styles.textStyle11),
              ],
            ),
          ],
        ),
      ),
    ),
  ],
)
;
  }
}