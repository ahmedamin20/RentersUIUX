import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repository/change_password_repo/change_password_repo.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState>
{
  ChangePasswordCubit(this.changePasswordRepo) : super(ChangePasswordInitial());
  static ChangePasswordCubit get(context) => BlocProvider.of(context);
  ChangePasswordRepo changePasswordRepo;
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool changePasswordVisibility = true;
  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  })
  async
  {
    emit(ChangePasswordLoadingState());
    final response = await changePasswordRepo.
    changePassword
      (
      oldPassword: oldPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );
    response.fold((error)
    {
      emit(ChangePasswordErrorState(error.message));
    }, (data) {
      emit(ChangePasswordSuccessState());
    });
  }

}
