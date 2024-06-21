import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ksb/core/helpers/dio_helpers/dio_helpers.dart';
import 'package:ksb/core/helpers/dio_helpers/end_points.dart';
import 'package:ksb/core/services/error/failuar.dart';

abstract class RegisterRepo {
  Future<Either<Failure, bool>> registerUser(
      {required String email,
      required String password,
      required String name,
      required String phone,
      required String address,
      required String frontID,
      required String backId});
}

class RegisterRepoImpl extends RegisterRepo {
  @override
  Future<Either<Failure, bool>> registerUser(
      {required String email,
      required String password,
      required String name,
      required String phone,
      required String address,
      required String frontID,
      required String backId}) async {
    try {
      FormData formData = FormData.fromMap({
        "name": name,
        "email": email,
        "address": address,
        "phone": phone,
        "password": password,
        "approve_terms": true,
        "password_confirmation": password,
        "front_national_id": await MultipartFile.fromFile(frontID),
        "back_national_id": await MultipartFile.fromFile(backId),
      });
      Response response = await DioHelper.postData(
          url: EndPoint.REGISTER_END_POINT, data: formData);

      return const Right(true);
    } on DioException catch (dioError) {
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }
}
