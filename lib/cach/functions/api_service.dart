import 'package:dio/dio.dart';

class ApiService {

  final String _baseUrl="https://api.jikan.moe/v4/";
  final Dio dio;

  ApiService({required this.dio});

  Future<Map<String,dynamic>>get({required String endPoint})async{
  var response = await dio.get("$_baseUrl$endPoint");
  return response.data;
  }
}