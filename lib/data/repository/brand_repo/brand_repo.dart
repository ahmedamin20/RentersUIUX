import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ksb/data/model/product_model/product_model.dart';

import '../../../core/helpers/dio_helpers/dio_helpers.dart';
import '../../../core/helpers/dio_helpers/end_points.dart';
import '../../../core/services/error/failuar.dart';
import '../../model/brand_model/brand_model.dart';

abstract class BrandRepo
{
  Future<Either<Failure , BrandModel>> getBrand(int page);
  Future<Either<Failure , GetProductModel>> getBrandProduct({
    required int brandId,
    String ? search,
    int ? page,
});
}
class BrandRepoImpl extends BrandRepo
{
  @override
  Future<Either<Failure, BrandModel>> getBrand(int page)
 async
 {
   try
   {
      Response response = await DioHelper.getData(url: EndPoint.BRAD_END_POINT ,
      queryParameters: {
        "page" : page,
        "per_page" : "25",
      }
      );
      return Right(BrandModel.fromJson(response.data));
   }
   on DioException catch(e)
   {
     return Left(ServerFailure.fromDioError(e));
   } catch(e)
   {
     return Left(FailureLocal(message: e.toString()));
   }
  }

  @override
  Future<Either<Failure, GetProductModel>>
  getBrandProduct({required int brandId, String? search, int? page})
 async
 {
    try
    {
      Response response = await DioHelper.getData(url: EndPoint.GET_PRODUCT_END_POINT ,
      queryParameters: {
        "brand_id" : brandId,
        "handle" : search,
        "page" : page,
        "per_page" : "25",
        "with_favorites" : "yes",

      }
      );
      return Right(GetProductModel.fromJson(response.data));
    } on DioException catch(e)
    {
      return Left(ServerFailure.fromDioError(e));
    } catch(e)
    {
      return Left(FailureLocal(message: e.toString()));
    }
  }

}