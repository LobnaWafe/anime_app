
// import 'package:anime_app/core/errors/autho_failure.dart';
// import 'package:anime_app/features/authentication/data/models/auth_model.dart';
// import 'package:dartz/dartz.dart';
// import 'package:image_picker/image_picker.dart';

// abstract class AuthoHomeRepo {
//   Future<Either<AuthoFailure,AuthModel>>signIn_Method({required String email,required String password});

//   Future<Either<AuthoFailure,AuthModel>>signup_Method(
//     {
//     required String email,
//     required String password,
//     required String fName,
//     required String sName,
//      XFile? imageFile
//   }
//   );
// }

import 'package:anime_app/core/errors/autho_failure.dart';
import 'package:anime_app/features/authentication/data/models/auth_model.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class AuthoHomeRepo {
  Future<Either<AuthoFailure, AuthModel>> signIn_Method({
    required String email,
    required String password,
  });

  Future<Either<AuthoFailure, AuthModel>> signup_Method({
    required String email,
    required String password,
    required String fName,
    required String sName,
    XFile? imageFile, // nullable
    required String defaultAvatarUrl, // default
  });

 Future<Either<AuthoFailure, AuthModel>> updateUserName_Method({
    required String fName,
    required String sName,
  });

  Future<Either<AuthoFailure, AuthModel>> updateUserImage_Method({
   required String oldImage
  });
 

}
