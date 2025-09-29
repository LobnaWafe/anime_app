import 'package:anime_app/core/utils/app_router.dart';
import 'package:anime_app/features/authentication/presentation/view_models/signup_cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomFormButtonSIgnUp extends StatelessWidget {
  const CustomFormButtonSIgnUp({super.key, this.onPressed, required this.buttonName});
  final void Function()? onPressed;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
        snackBarMethod(context, "Success");
        GoRouter.of(context).push(AppRouter.kHomeView );

        } else if (state is SignupFailuer) {
          snackBarMethod(context, state.errorMsg);
          print(state.errorMsg);
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: 45,
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextButton(
            onPressed: onPressed,

            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: state is SignupLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : Text(buttonName),
          ),
        );
      },
    );
  }

  void snackBarMethod(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
