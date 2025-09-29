import 'package:anime_app/cach/cach_helper.dart';
import 'package:anime_app/features/authentication/data/models/auth_model.dart';
import 'package:anime_app/features/authentication/repos/auth_home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'update_state.dart';

class UpdateCubit extends Cubit<UpdateState> {
  UpdateCubit(this.homeRepo) : super(UpdateInitial());

   final AuthoHomeRepo homeRepo;

   Future<void>updateUserName({required String fName, required String sName})async{
     emit(UpdateLoading());
    var data=await homeRepo.updateUserName_Method(fName: fName, sName: sName);

    data.fold(
      (failure){
     emit(UpdateFailure(errorMsg: failure.errorMsg));
      }
      , (authModel){
    emit(UpdateSuccess(authModel: authModel));
      CacheHelper.removeData(key: "user");
      CacheHelper.saveCustomData(key: "user", value: authModel);
      });
   }

Future<void>updateUserImage({required String oldImage})async{
      emit(UpdateLoading());
    var data=await homeRepo.updateUserImage_Method(oldImage: oldImage);

    data.fold(
      (failure){
     emit(UpdateFailure(errorMsg: failure.errorMsg));
      }
      , (authModel){
    emit(UpdateSuccess(authModel: authModel));
      CacheHelper.removeData(key: "user");
      CacheHelper.saveCustomData(key: "user", value: authModel);
      });
}
  
}
