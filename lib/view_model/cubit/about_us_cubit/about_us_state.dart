part of 'about_us_cubit.dart';

@immutable
abstract class AboutUsState {}

class AboutUsInitial extends AboutUsState {}
class AboutUsLoadingState extends AboutUsState {}
class AboutUsErrorState extends AboutUsState {
  String message;
  AboutUsErrorState(this.message);
}
class AboutUsSuccessState extends AboutUsState {
  AboutUsModel aboutUsModel;
  AboutUsSuccessState(this.aboutUsModel);
}
