import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ksb/core/helpers/dio_helpers/dio_helpers.dart';
import 'package:ksb/core/helpers/dio_helpers/end_points.dart';
import 'package:ksb/core/services/error/failuar.dart';

import '../../model/get_visit_history_details_model/get_visit_history_details_model.dart';
import '../../model/visit_history_model/visit_history_model.dart';

abstract class VisitHistoryRepo
{
  Future<Either<Failure , VisitHistoryModel>> getVisitHistory(int page);
  Future<Either<Failure , GetVisitHistoryDetailsModel>> getVisitHistoryDetails(String id);
  // Future<Either<Failure , >>
}
class VisitHistoryRepoImpl extends VisitHistoryRepo
{
  @override
  Future<Either<Failure, VisitHistoryModel>> getVisitHistory(int page)
  async
  {
    try
    {
      Response response  = await DioHelper.getData(url: EndPoint.GET_VISIT_HISTORY_END_POINT ,
      queryParameters: {
        "page" : page,
        "per_page" : "10"
      }
      );
      return Right(VisitHistoryModel.fromJson(response.data));
    } on DioException catch (e)
    {
      return Left(ServerFailure.fromDioError(e));

  }catch (e)
    {
      return Left(FailureLocal(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetVisitHistoryDetailsModel>>
  getVisitHistoryDetails(String id)
  async
  {
    try
    {
      Response response  = await DioHelper.getData(url: "${EndPoint.GET_VISIT_HISTORY_END_POINT}/$id");
      return Right(GetVisitHistoryDetailsModel.fromJson(response.data));
    } on DioException catch (e)
    {
      return Left(ServerFailure.fromDioError(e));

    }catch (e)
    {
      return Left(FailureLocal(message: e.toString()));
    }
  }
}