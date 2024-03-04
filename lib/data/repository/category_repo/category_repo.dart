import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ksb/core/services/error/failuar.dart';

import '../../../core/helpers/dio_helpers/dio_helpers.dart';
import '../../../core/helpers/helpers_functions/helpers_functions.dart';
import '../../model/category_model/category_model.dart';

abstract class CategoryRepo {
  Future<Either<Failure, CategoryModel>> getCategories();
}

class CategoryRepoImpl extends CategoryRepo {
  @override
  Future<Either<Failure, CategoryModel>> getCategories() async {
    try {
      var ressposne = await DioHelper.getData(
        url: "mobile/categories",
      );
      return Right(CategoryModel.fromJson(ressposne.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }
}
