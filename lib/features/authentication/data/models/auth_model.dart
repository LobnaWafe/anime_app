// auth_model.dart
import 'dart:convert';
import 'package:anime_app/constants.dart';

class AuthModel {
  final String email;
  final String id;
  final String firstName;
  final String secondName;
  final String imageUrl;

  AuthModel({
    required this.email,
    required this.id,
    required this.firstName,
    required this.secondName,
    required this.imageUrl,
  });

  factory AuthModel.fromJson(String jsonString) {
    final json = jsonDecode(jsonString);
    return AuthModel(
      email: json["email"],
      id: json["id"],
      firstName: json[kFirstName],
      secondName: json[kSecondName],
      imageUrl: json[kAvatar_url],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      kFirstName: firstName,
      kSecondName: secondName,
      'email': email,
      'id': id,
      kAvatar_url: imageUrl,
    };
  }
}
