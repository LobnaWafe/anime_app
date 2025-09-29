import 'package:anime_app/features/authentication/data/models/auth_model.dart';
import 'package:anime_app/features/authentication/presentation/view_models/update_cubit/update_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key, required this.authModel});
  final AuthModel authModel;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<UpdateCubit, UpdateState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  BlocProvider.of<UpdateCubit>(context).updateUserImage(oldImage: authModel.imageUrl);
                },
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  backgroundImage:state is UpdateSuccess?NetworkImage(state.authModel.imageUrl) :NetworkImage(authModel.imageUrl),
                ),
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
