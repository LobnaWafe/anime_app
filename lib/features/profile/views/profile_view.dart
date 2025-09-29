import 'package:anime_app/cach/cach_helper.dart';
import 'package:anime_app/features/authentication/data/models/auth_model.dart';
import 'package:anime_app/features/profile/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key,});
 //final AuthModel authModel;
 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: ProfileViewBody(authModel: userData(),)),
    );
  }
  AuthModel userData() {
    final userJson = CacheHelper.sharedPreferences.getString("user");
    final authModel = AuthModel.fromJson(userJson!);
    print("profile body image : ${authModel.imageUrl}");
    return authModel;
  }
}