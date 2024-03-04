part of 'reset_password_cubit.dart';

@immutable
abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}
class ForgetPasswordLoadingState extends ResetPasswordState {}
class ForgetPasswordSuccessState extends ResetPasswordState
{
  String message;
  ForgetPasswordSuccessState(this.message);
}
class ForgetPasswordErrorState extends ResetPasswordState
{
  final String error;
  ForgetPasswordErrorState(this.error);
}

class ResetPasswordLoadingState extends ResetPasswordState {}
class ResetPasswordSuccessState extends ResetPasswordState
{
  String message;

  ResetPasswordSuccessState(this.message );
}
class ResetPasswordErrorState extends ResetPasswordState
{
  final String error;
  ResetPasswordErrorState(this.error);
}
class ResetPasswordChangePasswordVisibilityState extends ResetPasswordState {}