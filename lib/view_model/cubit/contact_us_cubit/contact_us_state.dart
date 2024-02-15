part of 'contact_us_cubit.dart';

@immutable
abstract class ContactUsState {}

class ContactUsInitial extends ContactUsState {}

class ContactUsLoading extends ContactUsState {}
class ContactUsSuccess extends ContactUsState {
  final ContactUsModel contactUsModel;

  ContactUsSuccess(this.contactUsModel);
}
class ContactUsError extends ContactUsState {
  final String error;

  ContactUsError(this.error);
}
