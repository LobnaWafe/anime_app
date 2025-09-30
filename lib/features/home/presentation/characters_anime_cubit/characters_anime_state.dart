part of 'characters_anime_cubit.dart';

sealed class CharactersAnimeState extends Equatable {
  const CharactersAnimeState();

  @override
  List<Object> get props => [];
}

final class CharactersAnimeInitial extends CharactersAnimeState {}
final class CharactersAnimeLoading extends CharactersAnimeState {}
final class CharactersAnimeSuccess extends CharactersAnimeState {
  final List<CharacterModel> characterModelList;

 const CharactersAnimeSuccess({required this.characterModelList});
  
}
final class CharactersAnimeFailure extends CharactersAnimeState {
  final String errorMsg;

 const CharactersAnimeFailure({required this.errorMsg});
  
}