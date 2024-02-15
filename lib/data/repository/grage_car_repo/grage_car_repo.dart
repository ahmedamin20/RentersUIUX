import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/helpers/dio_helpers/dio_helpers.dart';
import '../../../core/helpers/dio_helpers/end_points.dart';
import '../../../core/services/error/failuar.dart';
import '../../model/brands_model/brands_model.dart';
import '../../model/car_grage_model/car_grage_model.dart';

abstract class GrageCarRepo {
  Future<Either<Failure, CarGrageModel>> getGrageCar({
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<Failure, BrandsModel>> getBrands();
}

class GrageCarRepoImpl extends GrageCarRepo {
  @override
  Future<Either<Failure, CarGrageModel>> getGrageCar({
    queryParameters,
  }) async {
    try {
      Response response = await DioHelper.getData(
          url: EndPoint.GRAGE_CAR_END_POINT, queryParameters: queryParameters);
      return right(CarGrageModel.fromJson(response.data));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(FailureLocal(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BrandsModel>> getBrands() async {
    try {
      Response response = await DioHelper.getData(url: EndPoint.GET_BRANDS);
      return right(BrandsModel.fromJson(response.data));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(FailureLocal(message: e.toString()));
    }
  }
}
