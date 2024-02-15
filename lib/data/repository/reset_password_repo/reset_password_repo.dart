import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/helpers/dio_helpers/dio_helpers.dart';
import '../../../core/helpers/dio_helpers/end_points.dart';
import '../../../core/services/error/failuar.dart';

abstract class ResetPasswordRepo {
  Future<Either<Failure, String>> sendForgetPassword({
    required String email,
  });
  Future<Either<Failure, String>>
  resetPassword({
    required String email,
    required String code,
    required String password,
    required String passwordConfirmation,
  });
}
class  ResetPasswordRepoImpl extends ResetPasswordRepo {
  @override
  Future<Either<Failure, String>> sendForgetPassword({
    required String email,
  }) async
  {
    try {
      final response = await DioHelper.postData(
        url: EndPoint.SEND_FORGET_PASSWORD_END_POINT,
        data: {
          "handle": email,
        },
      );
      return  Right(response.data['message']);
    } on DioException catch (dioError) {
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> resetPassword({
    required String email,
    required String code,
    required String password,
    required String passwordConfirmation,
  }) async
  {
    try {
      final response = await DioHelper.postData(
        url: EndPoint.RESET_PASSWORD_END_POINT,
        data:
        {
          "handle": email,
          "code": code,
          "password": password,
          "password_confirmation": passwordConfirmation,
        },
      );
      return  Right(response.data['message']);
    } on DioException catch (dioError) {
      return Left(ServerFailure.fromDioError(dioError));
    }
    catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }
}