
import 'package:anime_app/cach/cach_helper.dart';
import 'package:anime_app/features/authentication/data/models/auth_model.dart';
import 'package:anime_app/features/authentication/repos/auth_home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';


part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.homeRepo) : super(SignupInitial());
  final AuthoHomeRepo homeRepo;

  final defaultAvatarUrl =
      "https://hkxtaqbisnboczqhsodv.supabase.co/storage/v1/object/public/avatars/profilePhotos/avatar.png";

  XFile? imageFile; // nullable

  Future<void> signUpMethod({
    required String email,
    required String password,
    required String fName,
    required String sName,
  }) async {
    emit(SignupLoading());

    var data = await homeRepo.signup_Method(
      email: email,
      password: password,
      fName: fName,
      sName: sName,
      imageFile: imageFile, // ممكن تكون null
      defaultAvatarUrl: defaultAvatarUrl, // نبعتها للـ repo
    );
    if(imageFile == null){
    print("imageFile : null");
    }else{
      print("inageFile not null");
    }

    data.fold(
      (failure) {
        emit(SignupFailuer(errorMsg: failure.errorMsg));
      },
      (authModel) async {
        emit(SignupSuccess(authModel: authModel));
        await CacheHelper.saveCustomData(key: "user", value: authModel);
        print("signup cubit authoModel image ${authModel.imageUrl}");
      },
    );
  }
}

