import 'package:anime_app/features/favorit/presentation/view_models/favorite_animes_cubit/favorite_animes_cubit.dart';
import 'package:anime_app/features/favorit/presentation/widgets/fav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritViewBody extends StatelessWidget {
  const FavoritViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteAnimesCubit, FavoriteAnimesState>(
      builder: (context, state) {
        if(state is FavoriteAnimesSuccess){

        return state.favAnimeModel.isNotEmpty? GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // عنصرين في الصف
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 0.6, // هنا بيتظبط شكل الكارت كله (صورة + نص)
          ),
          itemCount: state.favAnimeModel.length,
          itemBuilder: (context, index) {
            return FavItem(favAnimeModel: state.favAnimeModel[index],);
          },
        ):
        Center(child: Text("There is No Anime (ㆆ_ㆆ)"),)
        ;
        }else if (state is FavoriteAnimesFailure){
       // snackBarMethod(context,state.errorMsg);
          return Center(child: Text("Sorry!,an error was happend"),);
        }else{
          return Center(child: CircularProgressIndicator(color: Colors.red,),);
        }
      },
    );
  }
    void snackBarMethod(BuildContext context,String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}

