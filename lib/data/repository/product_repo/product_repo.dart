import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ksb/core/helpers/dio_helpers/dio_helpers.dart';
import 'package:ksb/core/helpers/dio_helpers/end_points.dart';
import 'package:ksb/core/services/error/failuar.dart';

import '../../model/product_model/product_detiles/product_details_model.dart';
import '../../model/product_model/product_model.dart';

abstract class ProductRepo {
  Future<Either<Failure, ProductModel>> getProduct(int page);

  Future<Either<Failure, ProductDetailsModel>> getProductDetails(int productID);
}

class ProductRepoImpl extends ProductRepo {
  @override
  Future<Either<Failure, ProductModel>> getProduct(int page) async {
    try {
      Response response = await DioHelper.getData(
          url: EndPoint.productEndPoint,
          queryParameters: {
            'page': page,
          });

      return Right(ProductModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductDetailsModel>> getProductDetails(int productID) async {
    try {
      Response response = await DioHelper.getData(
        url: "${EndPoint.productEndPoint}/$productID",
      );

      return Right(ProductDetailsModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }
}