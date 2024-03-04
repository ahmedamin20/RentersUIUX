part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class GetProfileDataLoadingState extends ProfileState {}
class GetProfileDataSuccessState extends ProfileState {}
class GetProfileDataErrorState extends ProfileState
{
  final String error;
  GetProfileDataErrorState(this.error);
}
class SelectImageSuccessState  extends ProfileState {}

class UpdateProfileDataLoadingState extends ProfileState {}
class UpdateProfileDataSuccessState extends ProfileState {}
class UpdateProfileDataErrorState extends ProfileState
{
  final String error;
  UpdateProfileDataErrorState(this.error);
}
class LogoutLoadingState  extends ProfileState {}
class LogoutSuccessState  extends ProfileState {}
class LogoutErrorState  extends ProfileState
{
  final String error;
  LogoutErrorState(this.error);
}

class DeleteAccountLoadingState  extends ProfileState {}
class DeleteAccountSuccessState  extends ProfileState {}
class DeleteAccountErrorState  extends ProfileState
{
  final String error;
  DeleteAccountErrorState(this.error);
}
class ProfileChangePasswordVisibilityState extends ProfileState {}

class GetTermsAndCondationLoading extends ProfileState{}
class GetTermsAndCondationSuccess extends ProfileState{
  final TermsAndCondationModel termsAndCondationModel;
  GetTermsAndCondationSuccess(this.termsAndCondationModel);
}
class GetTermsAndCondationError extends ProfileState{
  final String error;
  GetTermsAndCondationError(this.error);
}

class ChangeLanguageState extends ProfileState{}
