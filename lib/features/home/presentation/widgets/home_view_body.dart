import 'package:anime_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: ElevatedButton(onPressed: (){
        GoRouter.of(context).push(AppRouter.kProfile);
      }, child: Text("profile page")),
    );
  }
}