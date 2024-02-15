part of 'car_fixes_cubit.dart';

@immutable
abstract class CarFixesState {}

class CarFixesInitial extends CarFixesState {}

class GetCarFixesLoadingState extends CarFixesState {}

class GetCarFixesSuccessState extends CarFixesState {

}
class GetCarFixErrorState extends CarFixesState {
  final String error;
  GetCarFixErrorState(this.error);
}

class GetCarFixesDetailsLoadingState extends CarFixesState {}
class GetCarFixesDetailsSuccessState extends CarFixesState {}
class GetCarFixesDetailsErrorState extends CarFixesState {
  final String error;
  GetCarFixesDetailsErrorState(this.error);
}
class SendApproveLoadingState extends CarFixesState {}
class SendApproveSuccessState extends CarFixesState
{
  final String message;
  SendApproveSuccessState(this.message);
}
class SendApproveErrorState extends CarFixesState {
  final String error;
  SendApproveErrorState(this.error);
}
class AcceptCarFixesTerms extends CarFixesState {}


class DownloadPdfLoadingState extends CarFixesState {}
class DownloadPdfSuccessState extends CarFixesState
{
  final String message;
  DownloadPdfSuccessState(this.message);
}
class DownloadPdfErrorState extends CarFixesState {
  final String error;
  DownloadPdfErrorState(this.error);
}
class SendReviewLoadingState extends CarFixesState {}
class SendReviewSuccessState extends CarFixesState
{
}
class SendReviewErrorState extends CarFixesState {
  final String error;
  SendReviewErrorState(this.error);
}