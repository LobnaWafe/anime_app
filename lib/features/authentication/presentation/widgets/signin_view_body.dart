import 'package:anime_app/core/utils/app_router.dart';
import 'package:anime_app/core/utils/styles.dart';
import 'package:anime_app/features/authentication/presentation/view_models/signin_cubit/signin_cubit.dart';
import 'package:anime_app/features/authentication/presentation/widgets/custom_form_button_signin.dart';
import 'package:anime_app/features/authentication/presentation/widgets/custom_form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final email = TextEditingController();

  final password = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Sign In", style: Styles.textStyle30),
            const SizedBox(height: 30),
            CustomFormTextField(
              obscureText: false,
              hintText: "Email",
              textController: email,
              check: 0,
            ),
            const SizedBox(height: 25),
            CustomFormTextField(
              obscureText: true,
              hintText: "Password",
              textController: password,
              check: 1,
            ),
            const SizedBox(height: 30),
            CustomFormButtonSIgnIn(
              buttonName: "Sign in",
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<SigninCubit>(
                    context,
                  ).signInMethod(email: email.text, password: password.text);
                }
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("doesn't have an account?", style: Styles.textStyle11),

                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kSignUpView);
                  },
                  child: Text(
                    "Sign Up",
                    style: Styles.textStyle11.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
