import 'package:anime_app/cach/functions/api_service.dart';
import 'package:anime_app/features/home/data/models/anime_model/anime_model.dart';
import 'package:anime_app/features/home/presentation/characters_anime_cubit/characters_anime_cubit.dart';
import 'package:anime_app/features/home/presentation/widgets/anime_details_view_body.dart';
import 'package:anime_app/features/home/presentation/widgets/characters_view_body.dart';
import 'package:anime_app/features/home/repos/home_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeDetailsView extends StatelessWidget {
  const AnimeDetailsView({super.key, required this.animeModel});
  final AnimeModel animeModel;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,

      child: BlocProvider(
        create: (context) => CharactersAnimeCubit(HomeRepoImp(api: ApiService(dio: Dio()))),
        child: Scaffold(
          appBar: AppBar(
            title: Row(children: [
              SizedBox(width: 210,child: Text(animeModel.title!)),
              IconButton(onPressed: (){}, icon:Icon( Icons.favorite_border))
            ],),
           
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
                AnimeDetailsViewBody(animeModel: animeModel),
                CharactersViewBody(characterNumber: animeModel.malId!,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
