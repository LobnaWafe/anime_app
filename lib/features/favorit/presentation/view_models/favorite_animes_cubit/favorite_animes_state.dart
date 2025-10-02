part of 'favorite_animes_cubit.dart';

sealed class FavoriteAnimesState extends Equatable {
  const FavoriteAnimesState();

  @override
  List<Object> get props => [];
}

final class FavoriteAnimesInitial extends FavoriteAnimesState {}

final class FavoriteAnimesLoading extends FavoriteAnimesState {}

final class FavoriteAnimesSuccess extends FavoriteAnimesState {
  final List<FavAnimeModel> favAnimeModel;

  const FavoriteAnimesSuccess({required this.favAnimeModel});

  @override
  List<Object> get props => [favAnimeModel];
}

final class FavoriteAnimesFailure extends FavoriteAnimesState {
  final String errorMsg;

  const FavoriteAnimesFailure({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
