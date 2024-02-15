import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repository/reset_password_repo/reset_password_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState>
{
  ResetPasswordCubit(this.resetPasswordRepo) : super(ResetPasswordInitial());
  static ResetPasswordCubit get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  ResetPasswordRepo resetPasswordRepo;
  String ? pin;
  bool isPassword = true;
  Future<void>  forgetPassword({
    required String email,
  })
  async
  {
    emit(ForgetPasswordLoadingState());
    final response = await resetPasswordRepo.sendForgetPassword(email: email);
    response.fold((error)
    {
      emit(ForgetPasswordErrorState(error.message));
    }, (data) {
      emit(ForgetPasswordSuccessState(data));
    });
  }

  Future<void> resetPassword({
    required String email,
    required String code,
    required String password,
    required String passwordConfirmation,
  }) async
  {
    emit(ResetPasswordLoadingState());
    final response = await resetPasswordRepo.resetPassword(
      email: email,
      code: code,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
    response.fold((error)
    {
      emit(ResetPasswordErrorState(error.message));
    }, (data) {
      emit(ResetPasswordSuccessState(data));
    });
  }

}
