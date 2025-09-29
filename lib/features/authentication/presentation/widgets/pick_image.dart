import 'dart:io';
import 'package:anime_app/features/authentication/presentation/view_models/signup_cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PickImageDemo extends StatefulWidget {
  @override
  State<PickImageDemo> createState() => _PickImageDemoState();
}

class _PickImageDemoState extends State<PickImageDemo> {
  XFile? _imageFile; // 👈 null في الأول (يعني مفيش صورة)

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );

    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
      // نحفظ الصورة في الكيوبت
      BlocProvider.of<SignupCubit>(context).imageFile = pickedFile;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: _pickImage,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.white,
              backgroundImage: _imageFile != null
                  ? FileImage(File(_imageFile!.path)) // 👈 حوّل XFile → File
                  : const NetworkImage(
                          "https://hkxtaqbisnboczqhsodv.supabase.co/storage/v1/object/public/avatars/profilePhotos/avatar.png",
                        )
                        as ImageProvider, // 👈 صورة default
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
