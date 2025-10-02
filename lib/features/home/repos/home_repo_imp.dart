import 'package:anime_app/core/functions/api_service.dart';
import 'package:anime_app/core/errors/failure.dart';
import 'package:anime_app/features/home/data/models/anime_model/anime_model.dart';
import 'package:anime_app/features/home/data/models/character_model/character_model.dart';
import 'package:anime_app/features/home/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImp implements HomeRepo{
  final ApiService api;

  HomeRepoImp({required this.api});

  @override
  Future<Either<Failure,List< AnimeModel>>> getAnime({required int genresNumber,required String order,required String sort}) async{
  try {
  var data = await api.get(endPoint: "anime?genres=$genresNumber&order_by=$order&sort=$sort");
  List<AnimeModel>animes= [];

  for(var item in data["data"]){
   animes.add(AnimeModel.fromJson(item));
  }
  print("home repo animes :$animes");
  return right(animes);

} on DioException catch (e) {
  return left(ServerFailure.dioException(e));
} catch (e){
  return left(ServerFailure(e.toString()));
}
  }


@override
    Future<Either<Failure,List< CharacterModel>>> getCharactersAnime({required int characterNumber}) async{
  try {
  var data = await api.get(endPoint: "anime/$characterNumber/characters");
  List<CharacterModel>animeCharacters= [];

  for(var item in data["data"]){
   animeCharacters.add(CharacterModel.fromJson(item));
  }
  //print("home repo animes :$animes");
  return right(animeCharacters);

} on DioException catch (e) {
  return left(ServerFailure.dioException(e));
} catch (e){
  return left(ServerFailure(e.toString()));
}

  
  }
  
  @override
  Future<Either<Failure, List<AnimeModel>>> getSearchAnime({required String animeName}) async{
     try {
  var data = await api.get(endPoint: "anime?q=$animeName");
  List<AnimeModel>searchAnimeList= [];

  for(var item in data["data"]){
   searchAnimeList.add(AnimeModel.fromJson(item));
  }
  //print("home repo animes :$animes");
  return right(searchAnimeList);

} on DioException catch (e) {
  return left(ServerFailure.dioException(e));
} catch (e){
  return left(ServerFailure(e.toString()));
}

  }

}