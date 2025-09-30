import 'package:anime_app/core/errors/failure.dart';
import 'package:anime_app/features/home/data/models/anime_model/anime_model.dart';
import 'package:anime_app/features/home/data/models/character_model/character_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure,List<AnimeModel>>>getAnime({required int genresNumber,required String order,required String sort});
   Future<Either<Failure,List< CharacterModel>>> getCharactersAnime({required int characterNumber});
}