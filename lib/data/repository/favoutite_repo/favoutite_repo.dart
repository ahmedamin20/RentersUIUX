import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ksb/core/services/error/failuar.dart';
import 'package:ksb/data/model/product_model/product_model.dart';

import '../../../core/helpers/dio_helpers/dio_helpers.dart';
import '../../../core/helpers/dio_helpers/end_points.dart';

abstract class FavouriteRepo
{
  Future<Either<Failure,bool>> toggleFavourite(int id , {String type = "product"});
}
class FavouriteRepoImpl extends FavouriteRepo
{
  @override
  Future<Either<Failure, bool>>
  toggleFavourite(int id ,
      {String type = "product"}
      )
 async {
    try
    {
      Response response =
          await DioHelper.
      patchData(
              url: EndPoint.TOGGLE_FAVOURITE_END_POINT,
          data:
          {
            "model_type": type,
            "model_id": id
          }
      );
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