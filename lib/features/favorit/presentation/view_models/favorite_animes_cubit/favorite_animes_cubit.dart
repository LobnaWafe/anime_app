import 'package:anime_app/cach/cach_helper.dart';
import 'package:anime_app/features/authentication/data/models/auth_model.dart';
import 'package:anime_app/features/favorit/data/models/fav_anime_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'favorite_animes_state.dart';

class FavoriteAnimesCubit extends Cubit<FavoriteAnimesState> {
  FavoriteAnimesCubit() : super(FavoriteAnimesInitial());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AuthModel get _currentUser {
    final userString = CacheHelper.getData(key: "user");
    return AuthModel.fromJson(userString);
  }

  String get _userEmail => _currentUser.email;


  Future<void> addFavAnime({required FavAnimeModel animeModel}) async {
    emit(FavoriteAnimesLoading());
    try {
      await _firestore
          .collection(_userEmail)
          .doc(animeModel.malId.toString())
          .set(animeModel.toJson());

      final favs = await getFavAnimesMethod();
      emit(FavoriteAnimesSuccess(favAnimeModel: favs));
    } on Exception catch (e) {
      emit(FavoriteAnimesFailure(errorMsg: e.toString()));
    }
  }

  
  Future<void> getFavAnimes() async {
    try {
      emit(FavoriteAnimesLoading());

      final favs = await getFavAnimesMethod();
      emit(FavoriteAnimesSuccess(favAnimeModel: favs));
    } catch (e) {
      emit(FavoriteAnimesFailure(errorMsg: e.toString()));
    }
  }

  
  Future<void> removeFavAnime(int malId) async {
    try {
      emit(FavoriteAnimesLoading());

      await _firestore.collection(_userEmail).doc(malId.toString()).delete();

      final favs = await getFavAnimesMethod();
      emit(FavoriteAnimesSuccess(favAnimeModel: favs));
    } catch (e) {
      emit(FavoriteAnimesFailure(errorMsg: e.toString()));
    }
  }

  /////
  Future<List<FavAnimeModel>> getFavAnimesMethod() async {
    final snapshot = await _firestore.collection(_userEmail).get();

    final favs = snapshot.docs
        .map((doc) => FavAnimeModel.fromJson(doc.data()))
        .toList();

    return favs;
  }
}
