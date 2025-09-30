import 'package:anime_app/features/home/presentation/characters_anime_cubit/characters_anime_cubit.dart';
import 'package:anime_app/features/home/presentation/widgets/custom_anime_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersViewBody extends StatefulWidget {
  const CharactersViewBody({super.key, required this.characterNumber});
  final int characterNumber;
  @override
  State<CharactersViewBody> createState() => _CharactersViewBodyState();
}

class _CharactersViewBodyState extends State<CharactersViewBody> {
  @override
  void initState() {
    BlocProvider.of<CharactersAnimeCubit>(
      context,
    ).getCharactersForAnime(characterNumber: widget.characterNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersAnimeCubit, CharactersAnimeState>(
      builder: (context, state) {
        if (state is CharactersAnimeSuccess) {
          return state.characterModelList.isNotEmpty? GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // عنصرين في الصف
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 0.7, // هنا بيتظبط شكل الكارت كله (صورة + نص)
            ),
            itemCount: state.characterModelList.length,
            itemBuilder: (context, index) {
              final character = state.characterModelList[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    // الصورة تاخد المساحة المتاحة بشكل متناسق
                    child: CustomAnimeImage(
                      image: character.character!.images!.jpg!.imageUrl!,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${character.character!.name}",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              );
            },
          ):Center(child: Text("No Data ＞﹏＜"),);
        } else if (state is CharactersAnimeFailure) {
          print(state.errorMsg);
          return Center(child: Text("there was an error , please try again"));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class CustomAnimeImageCharacter extends StatelessWidget {
  const CustomAnimeImageCharacter({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.cover, // يغطي المساحة بشكل متناسق
        errorWidget: (context, url, error) => const Icon(Icons.broken_image),
      ),
    );
  }
}
