import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/services/error/failuar.dart';
import '../../model/about_us_model/about_us_model.dart';
import '../../../core/helpers/dio_helpers/dio_helpers.dart';
import '../../../core/helpers/dio_helpers/end_points.dart';

abstract class AboutUsRepo {
  Future<Either<Failure, AboutUsModel>> getAboutUs();
}
class AboutUsRepoImpl extends AboutUsRepo {
  @override
  Future<Either<Failure, AboutUsModel>> getAboutUs() async {
    try {
      Response response = await DioHelper.getData(
        url: EndPoint.aboutUsEndPoint,
      );
      return Right(AboutUsModel.fromJson(response.data));
    } on DioException catch (dioError) {
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }
}