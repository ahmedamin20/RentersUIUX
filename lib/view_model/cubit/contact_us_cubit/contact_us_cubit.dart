import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/contact_us_model/contact_us_model.dart';
import '../../../data/repository/contact_us_repo/conatct_us_repo.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit(this.contactUsRepo) : super(ContactUsInitial());
  static ContactUsCubit get(context) => BlocProvider.of(context);
  ContactUsRepo contactUsRepo;
  GlobalKey<FormState> contactUsKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  void contactUs() {
    emit(ContactUsLoading());
    contactUsRepo
        .getContactUs(
            email: emailController.text,
            name: nameController.text,
            phone: phoneController.text,
            message: messageController.text)
        .then((value) {
      value.fold((error) {
        emit(ContactUsError(error.toString()));
      }, (value) {
        emit(ContactUsSuccess(value));
      });
    });
  }
}
