import 'package:anime_app/features/authentication/presentation/widgets/signin_view_body.dart';
import 'package:flutter/material.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: SigninViewBody()),
    );
  }
}