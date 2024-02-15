part of 'verify_cubit.dart';

@immutable
abstract class VerifyState {}

class VerifyInitial extends VerifyState {}
class VerifyEmailLoading extends VerifyState {}
class VerifyEmailSuccess extends VerifyState {}
class VerifyEmailError extends VerifyState
{
  final String error;
  VerifyEmailError({required this.error});
}
class ResendVerifyEmailLoading extends VerifyState {}
class ResendVerifyEmailSuccess extends VerifyState {}
class ResendVerifyEmailError extends VerifyState
{
  final String error;
  ResendVerifyEmailError({required this.error});
}


