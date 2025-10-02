import 'dart:convert';

import 'package:anime_app/features/authentication/data/models/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

//! Here The Initialize of cache .
 static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  String? getDataString({required String key}) {
    return sharedPreferences.getString(key);
  }

//! this method to put data in local database using key

static Future<bool> saveData({required String key, required dynamic value}) async {
  if (value is bool) {
    return await sharedPreferences.setBool(key, value);
  } else if (value is String) {
    return await sharedPreferences.setString(key, value);
  } else if (value is int) {
    return await sharedPreferences.setInt(key, value);
  } else if (value is double) {
    return await sharedPreferences.setDouble(key, value);
  } else if (value is List<String>) {
    return await sharedPreferences.setStringList(key, value);
  } else {
    throw Exception("Unsupported type for saveData");
  }
}


  static Future<bool> saveCustomData({required String key, required dynamic value}) async {
   if (value is AuthModel) {
    return await sharedPreferences.setString(key, jsonEncode(value.toJson()));
  } 
  else {
    throw Exception("Unsupported type for saveData");
  }
    
  }


//! this method to get data already saved in local database

  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

//! remove data using specific key

static  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

//! this method to check if local database contains {key}
  Future<bool> containsKey({required String key}) async {
    return sharedPreferences.containsKey(key);
  }

  Future<bool> clearData({required String key}) async {
    return sharedPreferences.clear();
  }

//! this fun to put data in local data base using key
  Future<dynamic> put({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setInt(key, value);
    }
  }

  ////////////////////

 static void addToFavorites(int animeId) {
  // استرجع الليست من الكاش
  List<String> stringIds = CacheHelper.getData(key: "favAnimeIdList") ?? [];
  List<int> ids = stringIds.map((e) => int.parse(e)).toList();

  // ضيف الـ animeId لو مش موجود
  if (!ids.contains(animeId)) {
    ids.add(animeId);
  }

  // خزنه تاني بعد تحويله لـ List<String>
  CacheHelper.saveData(
    key: "favAnimeIdList",
    value: ids.map((e) => e.toString()).toList(),
  );
}

static List<int> getFavorites() {
  List<String> stringIds = CacheHelper.getData(key: "favAnimeIdList") ?? [];
  return stringIds.map((e) => int.parse(e)).toList();
}


static void removeFromFavorites(int animeId) {
  // استرجاع الليست
  List<String> stringIds = CacheHelper.getData(key: "favAnimeIdList") ?? [];
  List<int> ids = stringIds.map((e) => int.parse(e)).toList();

  // لو موجود امسحه
  ids.remove(animeId);

  // خزنه تاني بعد المسح
  CacheHelper.saveData(
    key: "favAnimeIdList",
    value: ids.map((e) => e.toString()).toList(),
  );
}

}