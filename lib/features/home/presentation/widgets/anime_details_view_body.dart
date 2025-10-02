import 'package:anime_app/core/utils/styles.dart';
import 'package:anime_app/features/home/data/models/anime_model/anime_model.dart';
import 'package:anime_app/features/home/presentation/widgets/custom_anime_image.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimeDetailsViewBody extends StatelessWidget {
  const AnimeDetailsViewBody({super.key, required this.animeModel});
  final AnimeModel animeModel;

  @override
  Widget build(BuildContext context) {
    final imageUrl = animeModel.images?.jpg?.imageUrl;
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 15, right: 10),
          child: Row(
            children: [
              SizedBox(width: 150, child: CustomAnimeImage(image: imageUrl!)),

              SizedBox(width: 5),
              Expanded(child: CustomTitle(animeModel: animeModel)),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  Text(
                    animeModel.score != null
                        ? "${animeModel.score!}"
                        : "no data",
                    style: Styles.textStyle16,
                  ),
                ],
              ),
              //   SizedBox(width: 30,),
              Column(
                children: [
                  Icon(Icons.favorite, color: Colors.red),
                  Text("${animeModel.favorites!}", style: Styles.textStyle16),
                ],
              ),

              Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      if (animeModel.trailer!.url != null) {
                        final Uri url = Uri.parse(animeModel.trailer!.url!);
                        await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        );

                        // if (await canLaunchUrl(url)) {
                        //   await launchUrl(url, mode: LaunchMode.externalApplication);
                        // } else {
                        //   throw "Could not launch $url";
                        // }
                      }
                    },
                    child: Icon(
                      Icons.play_circle_fill_outlined,
                      color: animeModel.trailer!.url != null
                          ? Colors.white
                          : const Color.fromARGB(255, 130, 129, 129),
                    ),
                  ),
                  Text(
                    animeModel.trailer!.url != null
                        ? "play a trailer"
                        : "no data",
                    style: Styles.textStyle16,
                  ),
                ],
              ),
            ],
          ),
        ),

        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 43, 43, 43),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                child: Text(
                  "${animeModel.synopsis}",
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              AnimeGenresListDetails(animeModel: animeModel),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("Episodes :", style: Styles.textStyle18),
                        Text(
                          animeModel.episodes != null
                              ? "${animeModel.episodes!}"
                              : "no data",
                          style: Styles.textStyle14,
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Text("Studio :", style: Styles.textStyle18),
                        Text(
                          (animeModel.studios != null &&
                                  animeModel.studios!.isNotEmpty)
                              ? "${animeModel.studios![0].name}"
                              : "no data",
                          style: Styles.textStyle14,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AnimeGenresListDetails extends StatelessWidget {
  const AnimeGenresListDetails({super.key, required this.animeModel});

  final AnimeModel animeModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemCount: animeModel.genres!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 86, 85, 85),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(animeModel.genres![index].name!),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.animeModel});

  final AnimeModel animeModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          animeModel.titleEnglish !=null?
          animeModel.titleEnglish!:animeModel.title!,
          style: Styles.textStyle20,
          textAlign: TextAlign.center, // علشان يبقى منظم
          maxLines: 2, // أقصى عدد أسطر (ممكن تزودي أو تشيليها خالص)
          overflow: TextOverflow.ellipsis, // لو تخطي الأسطر يضيف "..."
          softWrap: true,
        ),

        SizedBox(height: 5),
        Text(
          animeModel.titleJapanese!,
          style: Styles.textStyle14,
          textAlign: TextAlign.center, // علشان يبقى منظم
          maxLines: 2, // أقصى عدد أسطر (ممكن تزودي أو تشيليها خالص)
          overflow: TextOverflow.ellipsis, // لو تخطي الأسطر يضيف "..."
          softWrap: true,
        ),
        SizedBox(height: 10),
        Text(animeModel.status!, style: Styles.textStyle11),
        SizedBox(height: 10),
        Text(animeModel.aired!.string!, style: Styles.textStyle11),
        SizedBox(height: 10),
        Text(
          animeModel.rating != null ? animeModel.rating! : "no data",
          style: Styles.textStyle11,
        ),
      ],
    );
  }
}
