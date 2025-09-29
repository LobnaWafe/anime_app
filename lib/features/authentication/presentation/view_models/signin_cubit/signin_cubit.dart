import 'package:anime_app/cach/cach_helper.dart';
import 'package:anime_app/features/authentication/data/models/auth_model.dart';
import 'package:anime_app/features/authentication/repos/auth_home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.homeRepo) : super(SigninInitial());
 
  final AuthoHomeRepo homeRepo;

  Future<void>signInMethod({required String email,required String password})async{
    emit(SigninInLoading());
  var data= await homeRepo.signIn_Method(email: email, password: password);
    data.fold((failuer){
      emit(SigninInFailuer(errorMsg:failuer.errorMsg));
    },(authModel)async{
      emit(SigninSuccess(authModel: authModel));
      await CacheHelper.saveCustomData(key: "user", value: authModel);
    }
    );

  }
}
