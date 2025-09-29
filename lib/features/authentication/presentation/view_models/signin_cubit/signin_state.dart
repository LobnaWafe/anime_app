part of 'signin_cubit.dart';

sealed class SigninState extends Equatable {
  const SigninState();

  @override
  List<Object> get props => [];
}

final class SigninInitial extends SigninState {}
final class SigninInLoading extends SigninState {}
final class SigninSuccess extends SigninState {
  final AuthModel authModel;

 const SigninSuccess({required this.authModel});
  
}

final class SigninInFailuer extends SigninState {
  final String errorMsg;

 const SigninInFailuer({required this.errorMsg});
  
}