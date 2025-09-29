import 'package:anime_app/constants.dart';
import 'package:anime_app/core/errors/autho_failure.dart';

import 'package:anime_app/features/authentication/data/models/auth_model.dart';
import 'package:anime_app/features/authentication/repos/auth_home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthoHomeRepoImp implements AuthoHomeRepo {
  final client = Supabase.instance.client;

  @override
  Future<Either<AuthoFailure, AuthModel>> signIn_Method({
    required String email,
    required String password,
  }) async {
    try {
      final response = await client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return right(
        AuthModel(
          email: response.user!.email!,
          id: response.user!.id,
          firstName: response.user!.userMetadata![kFirstName],
          secondName: response.user!.userMetadata![kSecondName],
          imageUrl: response.user!.userMetadata![kAvatar_url],
        ),
      );
    } on AuthException catch (e) {
      return left(AuthoServerFailure.fromSupabaseAuth(e));
    } catch (e) {
      return left(AuthoServerFailure.unexpectedError(e.toString()));
    }
  }

  @override
  Future<Either<AuthoFailure, AuthModel>> signup_Method({
    required String email,
    required String password,
    required String fName,
    required String sName,
    XFile? imageFile,
    required String defaultAvatarUrl,
  }) async {
    try {
      String imageUrl;

      if (imageFile == null) {
        // المستخدم ما رفعش صورة → نستخدم الـ default
        imageUrl = defaultAvatarUrl;
        print("defaultAvatarUrl");
      } else {
        final fileName = '${DateTime.now().millisecondsSinceEpoch}.png';
        final fullPath = "profilePhotos/$fileName"; // 👈 جوا الـ folder

        final bytes = await imageFile.readAsBytes();
        await client.storage.from('avatars').uploadBinary(fullPath, bytes);

        imageUrl = client.storage.from('avatars').getPublicUrl(fullPath);
      }

      final response = await client.auth.signUp(
        password: password,
        email: email,
        data: {
          kFirstName: fName,
          kSecondName: sName,
          kAvatar_url: imageUrl,
        },
      );

      return right(
        AuthModel(
          email: response.user!.email!,
          id: response.user!.id,
          firstName: response.user!.userMetadata![kFirstName],
          secondName: response.user!.userMetadata![kSecondName],
          imageUrl: response.user!.userMetadata![kAvatar_url],
        ),
      );
    } on AuthException catch (e) {
      return left(AuthoServerFailure.fromSupabaseAuth(e));
    } catch (e) {
      return left(AuthoServerFailure.unexpectedError(e.toString()));
    }
  }


  @override
  Future<Either<AuthoFailure, AuthModel>> updateUserName_Method({
    required String fName,
    required String sName,
  }) async {
    try {
      final response = await client.auth.updateUser(
        UserAttributes(data: {kFirstName: fName, kSecondName: sName}),
      );
      return right(
        AuthModel(
          email: response.user!.email!,
          id: response.user!.id,
          firstName: response.user!.userMetadata![kFirstName],
          secondName: response.user!.userMetadata![kSecondName],
          imageUrl: response.user!.userMetadata![kAvatar_url],
        ),
      );
    } on AuthException catch (e) {
      return left(AuthoServerFailure.fromSupabaseAuth(e));
    } catch (e) {
      return left(AuthoServerFailure.unexpectedError(e.toString()));
    }
  }

  @override
 Future<Either<AuthoFailure, AuthModel>> updateUserImage_Method({
    required String oldImage,
  }) async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 600,
      );

      if (pickedFile == null) {
        return left(AuthoServerFailure.unexpectedError("No image selected"));
      }

      final extension = pickedFile.path.split('.').last;
      final fileName = '${DateTime.now().millisecondsSinceEpoch}.$extension';
      final fullPath = "profilePhotos/$fileName"; // 👈 جوا الـ folder

      final bytes = await pickedFile.readAsBytes();
      await client.storage.from('avatars').uploadBinary(fullPath, bytes);

      final imageUrl = client.storage.from('avatars').getPublicUrl(fullPath);

      // delete old image (إلا لو default)
      if (!oldImage.endsWith("avatar.png")) {
        final oldPath = oldImage.split("/avatars/").last;
        // oldPath هيكون مثلاً: profilePhotos/12345.png
        final res = await client.storage.from("avatars").remove([oldPath]);

 // final re2 = await client.storage.from("avatars").remove(["profilePhotos/1759158454385.png"]);

final filesAfter = await client.storage.from("avatars").list(path: "profilePhotos");
for (final f in filesAfter) {
  print("AFTER DELETE file: ${f.name}");
}

        print("old image : $oldImage , oldpath : $oldPath\nres : $res");
      }


      final response = await client.auth.updateUser(
        UserAttributes(data: {kAvatar_url: imageUrl}),
      );

      return right(
        AuthModel(
          email: response.user!.email!,
          id: response.user!.id,
          firstName: response.user!.userMetadata![kFirstName],
          secondName: response.user!.userMetadata![kSecondName],
          imageUrl: response.user!.userMetadata![kAvatar_url],
        ),
      );
    } on AuthException catch (e) {
      return left(AuthoServerFailure.fromSupabaseAuth(e));
    } catch (e) {
      return left(AuthoServerFailure.unexpectedError(e.toString()));
    }
  }


/*Future<Either<AuthoFailure, AuthModel>> updateUserImage_Method({
  required String oldImage,
}) async {
  try {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );

    if (pickedFile == null) {
      return left(AuthoServerFailure.unexpectedError("No image selected"));
    }

    // استخدم اسم فريد جديد دائماً
    final extension = pickedFile.path.split('.').last;
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.$extension';
    final fullPath = "profilePhotos/$fileName";

    final bytes = await pickedFile.readAsBytes();
    
    // الرفع مع إمكانية الاستبدال
    await client.storage.from('avatars').uploadBinary(
      fullPath, 
      bytes,
      fileOptions: FileOptions(upsert: true) // ← هنا السر
    );

    final imageUrl = client.storage.from('avatars').getPublicUrl(fullPath);

    // احذف الصورة القديمة إذا مش الافتراضية
    if (!oldImage.endsWith("avatar.png")) {
      try {
        final oldPath = oldImage.split("/avatars/").last;
        await client.storage.from("avatars").remove([oldPath]);
        print("Old image deleted: $oldPath");
      } catch (e) {
        print("Error deleting old image: $e");
        // ما توقفش العملية إذا فشل الحذف
      }
    }

    final response = await client.auth.updateUser(
      UserAttributes(data: {kAvatar_url: imageUrl}),
    );

    return right(
      AuthModel(
        email: response.user!.email!,
        id: response.user!.id,
        firstName: response.user!.userMetadata![kFirstName],
        secondName: response.user!.userMetadata![kSecondName],
        imageUrl: imageUrl, // استخدم الرابط الجديد مباشرة
      ),
    );
  } on AuthException catch (e) {
    return left(AuthoServerFailure.fromSupabaseAuth(e));
  } catch (e) {
    return left(AuthoServerFailure.unexpectedError(e.toString()));
  }
}*/

}
