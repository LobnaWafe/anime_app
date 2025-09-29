part of 'signup_cubit.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

final class SignupInitial extends SignupState {}
final class SignupLoading extends SignupState {}
final class SignupSuccess extends SignupState {
  final AuthModel authModel;

 const SignupSuccess({required this.authModel});
  
}
final class SignupFailuer extends SignupState {
  final String errorMsg;

 const SignupFailuer({required this.errorMsg});
  
}