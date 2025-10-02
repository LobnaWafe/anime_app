import 'package:anime_app/cach/cach_helper.dart';
import 'package:anime_app/core/functions/api_service.dart';
import 'package:anime_app/features/favorit/data/models/fav_anime_model.dart';
import 'package:anime_app/features/favorit/presentation/view_models/favorite_animes_cubit/favorite_animes_cubit.dart';
import 'package:anime_app/features/home/data/models/anime_model/anime_model.dart';
import 'package:anime_app/features/home/presentation/characters_anime_cubit/characters_anime_cubit.dart';
import 'package:anime_app/features/home/presentation/widgets/anime_details_view_body.dart';
import 'package:anime_app/features/home/presentation/widgets/characters_view_body.dart';
import 'package:anime_app/features/home/repos/home_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeDetailsView extends StatefulWidget {
  AnimeDetailsView({super.key, required this.animeModel, required this.check});
  final AnimeModel animeModel;
  bool check;
  @override
  State<AnimeDetailsView> createState() => _AnimeDetailsViewState();
}

class _AnimeDetailsViewState extends State<AnimeDetailsView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,

      child: BlocProvider(
        create: (context) =>
            CharactersAnimeCubit(HomeRepoImp(api: ApiService(dio: Dio()))),
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                SizedBox(width: 210, child: Text(widget.animeModel.title!)),
                IconButton(
                  onPressed: () {
                    if (widget.check) {
                      widget.check = false;
                      CacheHelper.removeFromFavorites(widget.animeModel.malId!);

                      //firebase
                      BlocProvider.of<FavoriteAnimesCubit>(context).removeFavAnime(widget.animeModel.malId!);
                    } else {
                      widget.check = true;
                      CacheHelper.addToFavorites(widget.animeModel.malId!);
                    
                    final anime_model=FavAnimeModel(malId:widget.animeModel.malId!,rate:widget.animeModel.score !=null? widget.animeModel.score!.toInt():0,
                      titleEnglish: widget.animeModel.titleEnglish!,status: widget.animeModel.status !=null ?widget.animeModel.status!:"unKnown",
                      imageUrl: widget.animeModel.images!.jpg!.imageUrl!
                      );
                      //firebase
                       BlocProvider.of<FavoriteAnimesCubit>(context).addFavAnime(animeModel:anime_model );
                    }

                    setState(() {});
                  },
                  icon: Icon(
                    widget.check == true
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                ),
              ],
            ),

            bottom: TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,

              dividerHeight: 0,
              tabs: [
                Tab(text: "Details"),
                Tab(text: "Characters"),
              ],
            ),
          ),
          body: SafeArea(
            child: TabBarView(
              children: [
                AnimeDetailsViewBody(animeModel: widget.animeModel),
                CharactersViewBody(characterNumber: widget.animeModel.malId!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
