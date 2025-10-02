import 'package:anime_app/cach/cach_helper.dart';
import 'package:anime_app/core/utils/app_router.dart';
import 'package:anime_app/features/search/presentation/widgets/custom_search_text_field.dart';
import 'package:anime_app/features/search/presentation/widgets/search_item.dart';
import 'package:anime_app/features/search/view_models/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [CustomSearchTextField(), SizedBox(height: 20),
        Expanded(child: SearchAnimeList())
        ],
      ),
    );
  }
}

class SearchAnimeList extends StatelessWidget {
  const SearchAnimeList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if(state is SearchSuccess){
        return ListView.builder(
          itemCount:state.listAnimeModel.length ,
          itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: GestureDetector(
              onTap: (){
                    final ids = CacheHelper.getFavorites();
                bool check = ids.contains(state.listAnimeModel[index].malId);

                GoRouter.of(context).push(
                  AppRouter.kAnimeDetailsView,
                  extra: {"anime": state.listAnimeModel[index], "check": check},
                );
              },
              child: SearchItem(animeModel: state.listAnimeModel[index],)),
          );
        });
        }else if (state is SearchFailure){
          return Center(child: Text("there is an error ,try again later"),);
        } else if(state is SearchEmpty){
          return Center(child: Text("Not Found （＞人＜）"),);
        }
        else if (state is SearchInitial){
           return Center(child: Text("Start Search !"),);
        }
        else {
       return Center(child: CircularProgressIndicator(color: Colors.red,));
        }
      },
    );
  }
}
