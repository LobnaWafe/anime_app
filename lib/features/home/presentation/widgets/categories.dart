// categories.dart
import 'package:anime_app/cach/cach_helper.dart';
import 'package:anime_app/core/utils/app_router.dart';
import 'package:anime_app/features/home/data/models/anime_model/anime_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Categories extends StatelessWidget {
  const Categories({super.key, required this.animeList});

  final List<AnimeModel> animeList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170, // fix unbounded height
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: animeList.length,
        itemBuilder: (context, index) {
          final imageUrl = animeList[index].images?.jpg?.imageUrl;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                final ids = CacheHelper.getFavorites();
                bool check = ids.contains(animeList[index].malId);

                GoRouter.of(context).push(
                  AppRouter.kAnimeDetailsView,
                  extra: {"anime": animeList[index], "check": check},
                );
              },
              child: Container(
                width: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: imageUrl != null
                        ? NetworkImage(imageUrl)
                        : const AssetImage("assets/images/null_image.webp")
                              as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
