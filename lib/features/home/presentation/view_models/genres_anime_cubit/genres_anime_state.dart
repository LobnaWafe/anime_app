part of 'genres_anime_cubit.dart';

sealed class GenresAnimeState extends Equatable {
  const GenresAnimeState();

  @override
  List<Object> get props => [];
}

final class GenresAnimeInitial extends GenresAnimeState {}
final class GenresAnimeLoading extends GenresAnimeState {}
final class GenresAnimeSuccess extends GenresAnimeState {
  final List<List<AnimeModel>>listAnimes;

 const GenresAnimeSuccess({required this.listAnimes});
  
}
final class GenresAnimeFailure extends GenresAnimeState {
  final String errorMsg;

 const GenresAnimeFailure({required this.errorMsg});
}