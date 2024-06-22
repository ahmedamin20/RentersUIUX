import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ksb/core/constants.dart';
import 'package:ksb/data/repository/register_repo/register_repo.dart';

part 'register_cubit_state.dart';

class RegisterCubitCubit extends Cubit<RegisterCubitState> {
  RegisterCubitCubit(this._repo) : super(RegisterCubitInitial());
  static RegisterCubitCubit get(context) => BlocProvider.of(context);
  RegisterRepo _repo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();
  XFile? frontID;
  XFile? backID;
  XFile? avatar;

  Future<void> pickImage(bool isFront) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      if (isFront) {
        frontID = image;
        emit(PickImageSuccess(image.path));
      } else {
        backID = image;
        emit(PickBackImageSuccess(image.path));
      }
    }
  }

  Future<void> pickImageAvatar(bool isFront) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      avatar = image;
      emit(PickAvatarImageSuccess(image.path));
    }
  }

  Future<void> register() async {
    emit(RegisterLoadingState());
    final response = await _repo.registerUser(
      email: emailController.text,
      password: passwordController.text,
      name: fullNameController.text,
      phone: phoneController.text,
      address: addressController.text,
      backId: backID!.path,
      frontID: frontID!.path,
      avatar: avatar!.path,
    );
    response.fold((error) {
      emit(RegisterErrorState(error.message));
    }, (data) {
      emit(RegisterSuccessfulyState());
    });
  }
}
