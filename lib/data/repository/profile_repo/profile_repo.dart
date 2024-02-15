import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ksb/core/helpers/dio_helpers/dio_helpers.dart';
import 'package:ksb/core/helpers/dio_helpers/end_points.dart';
import 'package:ksb/core/services/error/failuar.dart';
import 'package:ksb/data/model/terms_and_condatioon_model/terms_and_condation_model.dart';
import 'package:ksb/data/model/user_model/user_model.dart';

abstract class ProfileRepo
{
  Future<Either<Failure , UserModel>> getProfileInfo();
  Future<Either<Failure , bool>> updateProfile({
   required String name,
    required  String email,
    String avatar,
  }) ;
  Future<Either<Failure , bool>> logout();
  Future<Either<Failure , bool>> removeAccount(String password);
  Future<Either<Failure , TermsAndCondationModel>> getTermsAndCondation();
}
class ProfileRepoImpl extends ProfileRepo
{
  @override
  Future<Either<Failure , UserModel>> getProfileInfo()
  async
  {
  try
  {
    Response response = await DioHelper.getData(url: EndPoint.GET_PROFILE_END_POINT);
    return Right(UserModel.fromMap(response.data['data']));
  }on DioException catch(dioError)
  {
    return Left(ServerFailure.fromDioError(dioError));
  } catch (e) {
    return Left(FailureLocal(message: e.toString()));
  }
  }

  @override
  Future<Either<Failure, bool>> updateProfile({
   required String name,
    required  String email,
    String ?avatar,
})
  async
  {
    try
    {
      FormData data = FormData.fromMap(
          {
            "name" :name,
            "email" : email,
          });
      if(avatar  !=  "" )
        {
          data.files.add(MapEntry("avatar", await MultipartFile.fromFile(avatar!)));

        }
      Response response = await DioHelper
          .postData(url: EndPoint.UPDATE_PROFILE_END_POINT,
        data: data,
      );
      return Right(true);
    }on DioException catch(dioError)
    {
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> logout()
  async
  {
    try
    {
      Response response = await DioHelper.postData(url: EndPoint.LOGOUT_END_POINT,
      data: {}
      );
      return const Right(true);
    }on DioException catch(dioError)
    {
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure , bool>> removeAccount(String password)
  async
  {
    try
    {
      Response response = await DioHelper.
      postData(
        url: EndPoint.REMOVE_ACCOUNT_END_POINT,
      data: {
        "current_password" : password,
      }
      );
      return const Right(true);
    } on DioException catch(dioError)
    {
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TermsAndCondationModel>> 
  getTermsAndCondation()
  async
  {
    try
    {
      Response response = await DioHelper.
      getData(
          url: EndPoint.termsAndConditionUrl,
      );
      return  Right(TermsAndCondationModel.fromJson(response.data));
    } on DioException catch(dioError)
    {
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }
}