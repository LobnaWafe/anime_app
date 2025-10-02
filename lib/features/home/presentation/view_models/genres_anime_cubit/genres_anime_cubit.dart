import 'package:anime_app/features/home/data/models/anime_model/anime_model.dart';
import 'package:anime_app/features/home/repos/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'genres_anime_state.dart';

class GenresAnimeCubit extends Cubit<GenresAnimeState> {
  GenresAnimeCubit(this.homeRepo) : super(GenresAnimeInitial());
  final HomeRepo homeRepo;

  Future<void>getGenresAnime({required String order,required String sort})async{
    emit(GenresAnimeLoading());

   List<int>genresNumbers =[1,2,10,14]; //Action , Adventure , Fantasy , Horror
   List<List<AnimeModel>>listAnimes=[];
   bool check=false;
   String _failure="";

   for(var i in genresNumbers){
  var data = await homeRepo.getAnime(genresNumber: i,order: order,sort: sort);
  await Future.delayed(const Duration(milliseconds:300 ));
   data.fold((failure){
    check=true;
    _failure = failure.errorMsg ;
   // emit(GenresAnimeFailure(errorMsg: failure.errorMsg));
   }, (animes){
   listAnimes.add(animes);
   
   });
   }

   check == true?emit(GenresAnimeFailure(errorMsg: _failure)):
   emit(GenresAnimeSuccess(listAnimes: listAnimes));

   print("animes : $listAnimes");
    
  }
}
