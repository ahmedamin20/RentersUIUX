import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ksb/core/helpers/dio_helpers/dio_helpers.dart';
import 'package:ksb/core/helpers/dio_helpers/end_points.dart';

import '../../../core/services/error/failuar.dart';

abstract class  ChangePasswordRepo
{
  Future<Either<Failure , bool>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) ;
}
class ChangePasswordRepoImpl extends  ChangePasswordRepo{
  @override
  Future<Either<Failure, bool>> changePassword
      ({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword
      })
 async
 {
    try
    {
      Response response = await DioHelper.
      putData
        (
          url: EndPoint.CHANGE_PASSWORD_END_POINT,
          data:
          {
            "old_password": oldPassword,
            "new_password": newPassword,
            "confirm_password": confirmPassword,
          }
      );
      return const Right(true);
    }
    on DioException catch (e)
    {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }

}