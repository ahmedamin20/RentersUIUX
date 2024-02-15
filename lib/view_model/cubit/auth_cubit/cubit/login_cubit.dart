import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksb/core/helpers/facebook_helpers/facebook_helpers.dart';
import 'package:ksb/data/repository/login_repo/login_repo.dart';
import 'package:meta/meta.dart';

import '../../../../data/model/login_model/login_model/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._repo) : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  LoginRepo _repo;
  bool isPassword =true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isRememberMe = false;
  void changeRememberMe()
  {
    isRememberMe = !isRememberMe;
    emit(ChangeRememberMeState());
  }
  // change password state 
  void changePasswordState()
  {
    isPassword = !isPassword;
    emit(ChangePasswordState());
  }
  // login with email and password 
  Future<void> loginWithEmailAndPassword() async 
  {
    if (formKey.currentState!.validate()) 
    {
      emit(LoginLoadingState());
      final response = await _repo.
      loginUser(
          emailController.text, 
          passwordController.text
              );
      response.fold((error) 
      {
        emit(LoginErrorState(error.message, error.code!));
      }, (data) {
        emit(LoginSuccessState(data));
      });
    }
  }
  // Future<void> signInWithFacebook() async
  // {
  //   emit(LoginLoadingState());
  //   final response = await _repo.loginWithFaceBook();
  //   response.fold((error)
  //   {
  //
  //     emit(LoginErrorState(error.message , error.code));
  //   }, (data) {
  //     print(data);
  //     emit(LoginSuccessState(data));
  //   });
  // }
  // Future<void> signIInWithGoogle() async
  // {
  //   emit(LoginLoadingState());
  //   final response = await _repo.loginWithGoogle();
  //   response.fold((error)
  //   {
  //
  //     emit(LoginErrorState(error.message , error.code));
  //   }, (data) {
  //     print(data);
  //     emit(LoginSuccessState(data));
  //   });
  // }

}
