import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ksb/core/helpers/dio_helpers/dio_helpers.dart';
import 'package:ksb/core/helpers/dio_helpers/end_points.dart';
import 'package:ksb/core/services/error/failuar.dart';
import 'package:ksb/data/model/ads_model/ads_model.dart';

import '../../model/contact_us_model/contact_us_model.dart';

abstract class ContactUsRepo
{
  Future<Either<Failure , ContactUsModel>> getContactUs({required name,required email,required phone,required message});
}
class ContactUsRepoImpl extends ContactUsRepo
{
  @override
  Future<Either<Failure, ContactUsModel>> getContactUs({required name,required email,required phone,required message})
 async
 {
    try
    {

      Response response = await DioHelper.postData(
          url: EndPoint.contactUSEndPoint,
          data: {
            'name':name,
            'email':email,
            'phone':phone,
            'message':message,
      });
      return Right(ContactUsModel.fromJson(response.data));
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