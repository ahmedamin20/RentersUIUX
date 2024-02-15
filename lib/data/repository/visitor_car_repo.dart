import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/helpers/dio_helpers/dio_helpers.dart';
import '../../core/helpers/dio_helpers/end_points.dart';
import '../../core/services/error/failuar.dart';
import '../model/visitor_car_model/visitor_car_model.dart';
import '../model/visitor_car_models/visitor_car_model.dart';

abstract class VisitorCarRepo
{
  Future<Either<Failure , VisitorCarNewModel>>
  getCarVisitor(Map<String ,dynamic> queryParameters);
}
class VisitorCarRepoImpl extends VisitorCarRepo
{
  @override
  Future<Either<Failure, VisitorCarNewModel>>
  getCarVisitor(Map<String ,dynamic> queryParameters)
  async
  {
    try
    {
      Response response =
      await DioHelper.
      getData(url: EndPoint.VISITOR_CAR_END_POINT,
          queryParameters: queryParameters
          );
      return right(VisitorCarNewModel.fromJson(response.data));
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