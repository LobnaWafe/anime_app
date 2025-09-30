import 'package:anime_app/features/home/data/models/character_model/character_model.dart';
import 'package:anime_app/features/home/repos/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'characters_anime_state.dart';

class CharactersAnimeCubit extends Cubit<CharactersAnimeState> {
  CharactersAnimeCubit(this.homeRepo) : super(CharactersAnimeInitial());

  final HomeRepo homeRepo;

  Future<void>getCharactersForAnime({required int characterNumber})async{
  emit(CharactersAnimeLoading());

  var data =await homeRepo.getCharactersAnime(characterNumber: characterNumber);

  data.fold((failure){
    emit(CharactersAnimeFailure(errorMsg: failure.errorMsg));
  }, (characterList){
    emit(CharactersAnimeSuccess(characterModelList: characterList));
  });
  }
}
