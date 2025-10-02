import 'package:anime_app/core/utils/styles.dart';
import 'package:anime_app/features/authentication/presentation/view_models/signup_cubit/signup_cubit.dart';
import 'package:anime_app/features/authentication/presentation/widgets/custom_form_button_signup.dart';
import 'package:anime_app/features/authentication/presentation/widgets/custom_form_text_field.dart';
import 'package:anime_app/features/authentication/presentation/widgets/pick_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final email = TextEditingController();

  final password = TextEditingController();
 
 final fName = TextEditingController();
 final sName = TextEditingController();


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
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Center(child: const Text("Sign Up", style: Styles.textStyle30)),
            const SizedBox(height: 30),
            PickImageDemo(),
            const SizedBox(height: 15),
             CustomFormTextField(
              obscureText: false,
              hintText: "First Name",
              textController: fName,
              check: 2,
            ),
            const SizedBox(height: 25),
             CustomFormTextField(
              obscureText: false,
              hintText: "Second Name",
              textController: sName,
              check: 2,
            ),
            const SizedBox(height: 25),
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
            CustomFormButtonSIgnUp(
              buttonName: "Sign up",
              onPressed: () {
                if (formKey.currentState!.validate()) {
                 
                  BlocProvider.of<SignupCubit>(
                    context,
                  ).signUpMethod(email: email.text, password: password.text, fName: fName.text, sName: sName.text);
                }
              },
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("already have an account?", style: Styles.textStyle11),

                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  child: Text(
                    "Sign In",
                    style: Styles.textStyle11.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
