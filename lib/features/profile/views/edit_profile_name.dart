import 'package:anime_app/features/authentication/data/models/auth_model.dart';
import 'package:anime_app/features/authentication/presentation/view_models/update_cubit/update_cubit.dart';
import 'package:anime_app/features/profile/widgets/edit_custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditProfileName extends StatefulWidget {
  const EditProfileName({super.key, required this.authModel});

  final AuthModel authModel;

  @override
  State<EditProfileName> createState() => _EditProfileNameState();
}

class _EditProfileNameState extends State<EditProfileName> {
  late TextEditingController firstNameController;
  late TextEditingController secondNameController;

  @override
  void initState() {
    firstNameController = TextEditingController(
      text: widget.authModel.firstName,
    );
    secondNameController = TextEditingController(
      text: widget.authModel.secondName,
    );
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    secondNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateCubit, UpdateState>(
      listener: (context, state) {
        if (state is UpdateSuccess) {
          GoRouter.of(context).pop();
        } else if (state is UpdateFailure) {
          snackBarMethod(context, state.errorMsg);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text("Name")),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EditCustomTextField(
                    lableName: "First Name",
                    controller: firstNameController,
                  ),
                  SizedBox(height: 20),
                  EditCustomTextField(
                    lableName: "Second Name",
                    controller: secondNameController,
                  ),

                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<UpdateCubit>(context).updateUserName(
                        fName: firstNameController.text,
                        sName: secondNameController.text,
                      );
                    },
                    child: state is UpdateLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text("Save"),
                  ),
                ],
              ),
            ),
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
