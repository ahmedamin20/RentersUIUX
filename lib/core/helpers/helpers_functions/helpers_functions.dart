import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../services/error/failuar.dart';
import '../dio_helpers/dio_helpers.dart';

Future<Either<Failure, T>> getData<T>(
  String url,
  var queryParameters,
  T Function(dynamic json) fromJson,
) async {
  print("Amr");
  try {
    Response response =
        await DioHelper.getData(url: url, queryParameters: queryParameters);
    print(response.data);
    return Right(fromJson(response.data));
  } on DioException catch (e) {
    print(e);
    return Left(ServerFailure.fromDioError(e));
  } catch (e) {
    return Left(FailureLocal(message: e.toString()));
  }
}

// i want to send one of the function to the cubit and the cubit will call it and return the result to the ui
