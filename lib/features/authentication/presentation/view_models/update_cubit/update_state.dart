part of 'update_cubit.dart';

sealed class UpdateState extends Equatable {
  const UpdateState();

  @override
  List<Object> get props => [];
}

final class UpdateInitial extends UpdateState {}
final class UpdateLoading extends UpdateState {}
final class UpdateSuccess extends UpdateState {
  final AuthModel authModel;

 const UpdateSuccess({required this.authModel});
  
}
final class UpdateFailure extends UpdateState {
  final String errorMsg;

 const UpdateFailure({required this.errorMsg});
}