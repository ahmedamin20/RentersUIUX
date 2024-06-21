import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:ksb/core/helpers/dio_helpers/dio_helpers.dart';
import 'package:ksb/core/helpers/dio_helpers/end_points.dart';
import 'package:ksb/core/helpers/facebook_helpers/facebook_helpers.dart';
import 'package:ksb/core/helpers/google_helpers/google_helpers.dart';
import 'package:ksb/core/services/error/failuar.dart';
import 'package:ksb/data/model/login_model/login_model/login_model.dart';

abstract class LoginRepo 
{
  Future<Either<Failure , LoginModel>> loginUser(String email , String password);
    Future<Either<Failure,LoginModel>> loginWithFaceBook();
    Future<Either<Failure,LoginModel>> loginWithGoogle();

}
class LoginRepoImpl extends LoginRepo
{
  @override
  Future<Either<Failure, LoginModel>>
   loginUser
   (String email, 
   String password) 
   async {
      try
      {
        Response response = await 
         DioHelper.
         postData(url: "https://renters-api.ksbgarage.com/auth/login/mobile", 
         data:
          {
            "email" : email,
            "password" : password,
            "fcm_token" : "fcm_token"
          });
        return Right(LoginModel.fromJson(response.data));
      } 
      on DioException catch(dioError)
      {
        return Left(ServerFailure.fromDioError(dioError , login: true  ));
      } catch(e)
      {
        return Left(FailureLocal(message: e.toString()));
      }
    }

  @override
  Future<Either<Failure, LoginModel>> loginWithFaceBook()
  async
  {

    var accessToken = await FaceBookHelper.instance.loginFaceBook();
  if(accessToken.isLeft())
    {
      return Left(FailureLocal(message: "error"));
    }
    else
    {
      try
      {
        Response response = await
         DioHelper.
         postData(url: EndPoint.FACEBOOK_LOGIN_END_POINTS,
         data:
          {
            "access_token" : accessToken.getOrElse(() => ""),
            "provider": "facebook"
          });
        return Right(LoginModel.fromJson(response.data));
      }
      on DioException catch(dioError)
      {
        return Left(ServerFailure.fromDioError(dioError));
      } catch(e)
      {
        return Left(FailureLocal(message: e.toString()));
      }
    }
  }
  @override
  Future<Either<Failure, LoginModel>> loginWithGoogle()
  async
  {

    try
        {
          UserCredential? accessToken = await GoogleHelpers.instance.signInWithGoogle();

          Response response = await
          DioHelper.
          postData(url: EndPoint.FACEBOOK_LOGIN_END_POINTS,
              data:
              {
                "access_token" : accessToken!.credential!.accessToken.toString(),
                "provider": "google"
              });
          return Right(LoginModel.fromJson(response.data));
        } on DioException catch(dioError)
    {
      return Left(ServerFailure.fromDioError(dioError));
    } catch(e)
    {
      return Left(FailureLocal(message: e.toString()));
    }

  }
}