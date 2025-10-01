// home_view_body.dart
import 'package:anime_app/features/home/presentation/view_models/genres_anime_cubit/genres_anime_cubit.dart';
import 'package:anime_app/features/home/presentation/widgets/categories.dart';
import 'package:anime_app/features/home/presentation/widgets/general_button.dart';
import 'package:anime_app/features/home/presentation/widgets/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(height: 180, child: ImageSlider()),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 10)),

          SliverToBoxAdapter(child: GeneralButton()),

          SliverToBoxAdapter(child: SizedBox(height: 20)),

          SliverToBoxAdapter(child: ListAnimeCategories()),
        ],
      ),
    );
  }
}

class ListAnimeCategories extends StatelessWidget {
  const ListAnimeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GenresAnimeCubit, GenresAnimeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GenresAnimeSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Action
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Action",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 5),
              Categories(animeList: state.listAnimes[0]),

              SizedBox(height: 35),
              //Adventure
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Adventure",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 5),
              Categories(animeList: state.listAnimes[1]),

              SizedBox(height: 35),
              //Fantasy
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Fantasy",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 5),
              Categories(animeList: state.listAnimes[2]),

              SizedBox(height: 35),

              //Horror
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Horror",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 5),
              Categories(animeList: state.listAnimes[3]),
            ],
          );
        } else if (state is GenresAnimeFailure) {
          return Center(child: Text("Oops!, there is an error"));
        } else {
          return Center(child: CircularProgressIndicator(color: Colors.red,));
        }
      },
    );
  }
}
