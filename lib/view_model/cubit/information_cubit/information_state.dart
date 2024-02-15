part of 'information_cubit.dart';

@immutable
abstract class InformationState {}

class InformationInitial extends InformationState {}

class GetTermsAndCondationLoading extends InformationState{}
class GetTermsAndCondationSuccess extends InformationState{
  final TermsAndCondationModel termsAndCondation;
  GetTermsAndCondationSuccess(this.termsAndCondation);
}
class GetTermsAndCondationError extends InformationState{
  final String error;
  GetTermsAndCondationError(this.error);
}

class GetInfoDataLoading extends InformationState{}
class GetInfoDataSuccess extends InformationState{
  final GetInfoDataModel getInfoDataModel;
  GetInfoDataSuccess(this.getInfoDataModel);
}