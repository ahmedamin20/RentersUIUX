import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ksb/core/helpers/dio_helpers/dio_helpers.dart';
import 'package:ksb/core/helpers/dio_helpers/end_points.dart';
import 'package:ksb/core/services/error/failuar.dart';
import 'package:ksb/data/model/ads_model/ads_model.dart';

abstract class AdsRepo
{
  Future<Either<Failure , AdsModel>> getAds();
}
class AdsRepoImpl extends AdsRepo
{
  @override
  Future<Either<Failure, AdsModel>> getAds()
 async
 {
    try
    {

      Response response = await DioHelper.getData(url: EndPoint.ADS_END_POINTS);
      return Right(AdsModel.fromJson(response.data));
    }
    on DioException catch(e)
    {
      return Left(ServerFailure.fromDioError(e));
    }
    catch(e)
    {
      return Left(FailureLocal(message: e.toString()));
    }
  }

}