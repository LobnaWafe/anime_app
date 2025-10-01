part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}
final class SearchLoading extends SearchState {}
final class SearchSuccess extends SearchState {
  final List<AnimeModel> listAnimeModel;

 const SearchSuccess({required this.listAnimeModel});
}
final class SearchFailure extends SearchState {
  final String errorMsg;

 const SearchFailure({required this.errorMsg});
  
}
final class SearchEmpty extends SearchState {}