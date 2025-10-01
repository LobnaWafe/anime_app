import 'package:anime_app/features/home/data/models/anime_model/anime_model.dart';
import 'package:anime_app/features/home/repos/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepo) : super(SearchInitial());
  final HomeRepo homeRepo;

  Future<void>getSearchAnimeList({required String animeName})async{
    emit(SearchLoading());

    var data = await homeRepo.getSearchAnime(animeName: animeName);

    data.fold((failure){
      emit(SearchFailure(errorMsg: failure.errorMsg));
    }, (animeList){
      emit(SearchSuccess(listAnimeModel:animeList ));
  //     if(animeList.isEmpty){
  //  emit(SearchSuccess(listAnimeModel:animeList ));
  //     }
  //  else{
  //  emit(SearchEmpty());
  //  }
    });
  }
}
