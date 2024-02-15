import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksb/data/repository/verify_repo/verify_repo.dart';
import 'package:meta/meta.dart';
import 'package:otp_text_field/otp_field.dart';

part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState>
{
  VerifyCubit(this._verifyRepo) : super(VerifyInitial());
  static VerifyCubit get(context) => BlocProvider.of(context);
  final VerifyRepo _verifyRepo ;
  OtpFieldController OTPController = OtpFieldController();
   String? code;
  Future<void> verifyEmail(
  {
   required String email,

  })
  async
  {
    emit(VerifyEmailLoading());
    final result = await _verifyRepo.
    verifyAccount(
        email: email,
        code: code!,
    );
    result.fold((error) {
      emit(VerifyEmailError(error: error.message));
    }, (data) {
      emit(VerifyEmailSuccess());
    });
  }
  Future<void> resendVerifyCodeToEmail(
      {
        required String email,

      })
  async
  {
    emit(ResendVerifyEmailLoading());
    final result = await _verifyRepo.resendVerifyAccount(
        email: email,
    );
    result.fold((error) {
      emit(ResendVerifyEmailError(error: error.message));
    }, (data) {
      emit(ResendVerifyEmailSuccess());
    });
  }
}
