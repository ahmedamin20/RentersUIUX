
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/data/model/terms_and_condatioon_model/terms_and_condation_model.dart';
import 'package:ksb/data/model/user_model/user_model.dart';
import 'package:meta/meta.dart';
import 'dart:io';
import '../../../core/helpers/pick_image/pick_image.dart';
import '../../../core/services/app_router.dart';
import '../../../data/model/profile_local_model/profile_local_model.dart';
import '../../../data/repository/profile_repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState>
{
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  bool isPassword = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ProfileRepo profileRepo;
  UserModel ?userModel;
  XFile ? profileImage;
  List<ProfileLocalModel> profileLocalModel =
  [
    ProfileLocalModel(
      title: "Change Password",
      iconPath: Icons.lock,
      route: AppRouter.changePasswordView,
    ),
    ProfileLocalModel(
      title: TextManager.CarFixes,
      iconPath: Icons.car_repair,
      route: AppRouter.carFixView,
    ),
    ProfileLocalModel(
      title: "Visitor History",
      iconPath: Icons.history,
      route: AppRouter.userVisitorView,
    ),
    ProfileLocalModel(
      title: "Terms and Conditions",
      iconPath: Icons.document_scanner_rounded,
      route: AppRouter.termsAndCondationView,
    ),
  ];

  String imageUser()
  {
    if(profileImage== null)
      {
        return userModel!.avatar!;
      }else{
      return profileImage!.path;
    }
  }
  void selectImage()
 async
 {
    profileImage = await PickImageHelper.pickImageHelper.pickImage();
    if(profileImage != null)
      {
        emit(SelectImageSuccessState());
      }
  }
  Future<void> getProfileData()
  async
  {
    emit(GetProfileDataLoadingState());
    final response = await profileRepo.getProfileInfo();
    response.fold((error) {
      print(error.message);
      emit(GetProfileDataErrorState(error.message));
    }, (data)
    {
      userModel = data;
      emit(GetProfileDataSuccessState());
    });
  }
  Future<void> updateProfileData()
  async
  {
    emit(UpdateProfileDataLoadingState());

    final response = await profileRepo
        .updateProfile(
     name: nameController.text,
      email: emailController.text,
      avatar: profileImage == null ? "" : profileImage!.path,
    );
    response.fold((error) {
      emit(UpdateProfileDataErrorState(error.message));
    }, (data)
    {
      getProfileData();
      emit(UpdateProfileDataSuccessState());
    });
  }
  Future<void> logout()
  async
  {
    emit(LogoutLoadingState());
    var response = await profileRepo.logout();
    response.fold((error) {
      emit(LogoutErrorState(error.message));
    }, (data)
    {
      emit(LogoutSuccessState());
    });
  }
  Future<void> deleteAccount()
  async
  {
    emit(DeleteAccountLoadingState());
    var response = await profileRepo.removeAccount(currentPasswordController.text);
    response.fold((error) {
      emit(DeleteAccountErrorState(error.message));
    }, (data)
    {
      emit(DeleteAccountSuccessState());
    });
  }
  Future<void> getTermsAndCondation()
  async
  {
    emit(GetTermsAndCondationLoading());
    var response = await profileRepo.getTermsAndCondation();
    response.fold((error) {
      emit(GetTermsAndCondationError(error.message));
    }, (data)
    {
      emit(GetTermsAndCondationSuccess(data));
    });
  }
  int currentIndex=0;
  void changeLanguage(index){
    currentIndex=index;
    emit(ChangeLanguageState());
  }


  // List<>
}
