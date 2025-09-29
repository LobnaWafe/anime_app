import 'package:anime_app/cach/cach_helper.dart';
import 'package:anime_app/core/utils/app_router.dart';
import 'package:anime_app/features/authentication/data/models/auth_model.dart';
import 'package:anime_app/features/profile/widgets/details.dart';
import 'package:anime_app/features/profile/widgets/image_profile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key, required this.authModel});
  final AuthModel authModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ListView(
        children: [
          SizedBox(height: 30),

          ImageProfile(authModel: authModel),
          
          SizedBox(height: 20),
          Details(
            onTap: (){
              GoRouter.of(context).push(AppRouter.kNameEditView,extra: authModel);
            },
            icon: Icons.person,
            detailName: "Name",
            text: "${authModel.firstName} ${authModel.secondName}",
          ),
          SizedBox(height: 20),
          Details(onTap: (){},
            icon: Icons.mail, detailName: "Email", text: authModel.email),
          SizedBox(height: 40),
          GestureDetector(
            onTap: (){
              _signOut(context);
            },
            child: Row(
              children: [
              Icon(Icons.logout,color: const Color.fromARGB(255, 80, 79, 79),),
               SizedBox(width: 15),
                Text("Sign Out"),
              ],
            ),
          ),
        ],
      ),
    );
  }

   Future<void> _signOut(BuildContext context) async {
    await CacheHelper.removeData(key: "user");
    GoRouter.of(context).go("/");
  }

}

