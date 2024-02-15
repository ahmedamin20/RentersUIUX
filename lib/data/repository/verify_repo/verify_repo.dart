import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ksb/core/helpers/dio_helpers/dio_helpers.dart';
import 'package:ksb/core/helpers/dio_helpers/end_points.dart';
import 'package:ksb/core/services/error/failuar.dart';

abstract class VerifyRepo
{
  Future<Either<Failure , bool>> verifyAccount({
      String code
    , String email});
  Future<Either<Failure , bool>> resendVerifyAccount({
    String email});
}
class VerifyRepoImpl extends VerifyRepo {
  @override
  Future<Either<Failure, bool>>
  verifyAccount({
    String ?code,
    String ?email})
  async
  {
    try
    {
      Response response =
     await DioHelper.
          postData(url: EndPoint.VERIFY_EMAIL_END_POINT,
          data: {
            "handle": email,
            "code": code
          });
      return right(true);
    }
    on DioException catch(e)
    {
      return left(ServerFailure.fromDioError(e));
    } catch(e)
    {
      return left(FailureLocal(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> resendVerifyAccount({
  String ? email})
  async
  {
    try
    {
      Response response =
      await DioHelper.
      postData(url: EndPoint.RESEND_VERIFY_EMAIL_END_POINT,
          data: {
            "handle": email,
          });
      return right(true);
    }
    on DioException catch(e)
    {
      return left(ServerFailure.fromDioError(e));
    } catch(e)
    {
      return left(FailureLocal(message: e.toString()));
    }
  }
}