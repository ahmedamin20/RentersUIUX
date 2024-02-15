import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ksb/core/helpers/dio_helpers/dio_helpers.dart';
import 'package:ksb/data/model/car_fixes_model/get_car_fixes_model.dart';
import 'package:path_provider/path_provider.dart';

import '../../../core/helpers/dio_helpers/end_points.dart';
import '../../../core/services/error/failuar.dart';
import '../../model/car_fix_detials_model/car_fix_details_model.dart';

abstract class CarFixesReo
{
  Future<Either<Failure , GetCarFixesModel>> getCarFixes(int page , {String ? search}) ;
  Future<Either<Failure , CarFixDetailsModel>> getCarFixesDetails( int id) ;
  Future<Either<Failure , String>> approveOrRejectCarFixes( int id , int status) ;
  Future<Either<Failure , String>> downloadPdfCarFix(int idCarFix) ;
  Future<Either<Failure , bool>> sendReview(int idCarFix , String review);

}
class CarFixesRepoImpl extends CarFixesReo
{
  @override
  Future<Either<Failure, GetCarFixesModel>> getCarFixes(int page ,  {String ? search}) async
  {
    try
    {
      Response response = await DioHelper.getData(url: EndPoint.CAR_FIXES_END_POINT ,
      queryParameters: {
        "page" : page,
        "per_page" : "10",
        "handle" : search
      }
      );
      return  Right(GetCarFixesModel.fromJson(response.data));
    } on DioException catch(e) {
      return Left(FailureLocal(message: e.toString()));
    } catch(e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CarFixDetailsModel>> getCarFixesDetails(int id)
  async
  {
    try
    {
      Response response = await DioHelper.getData(url: "${EndPoint.CAR_FIXES_END_POINT}/$id");
      return  Right(CarFixDetailsModel.fromJson(response.data));
    } on DioException catch(e) {
      return Left(FailureLocal(message: e.toString()));
    } catch(e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> approveOrRejectCarFixes(int id, int status)
  async
  {
    // 0 regiect
    // 1 approve
    try
    {
      Response response = await DioHelper.patchData(url: "${EndPoint.CAR_FIXES_END_POINT}/$id" ,
      data: {
        "approve" : status
      }
      );
      return  Right(response.data['message']);
    } on DioException catch(e) {
      return Left(FailureLocal(message: e.toString()));
    } catch(e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> downloadPdfCarFix(int idCarFix)
 async
 {
    try
    {
      final Directory appDocumentsDir = await getApplicationCacheDirectory();

      Response response = await DioHelper.
      downloadData(url:
      "${EndPoint.CAR_FIXES_PDF_END_POINT}/$idCarFix" ,
         savePath: "${appDocumentsDir.path}/$idCarFix.pdf" ,
token: "",
      );

      return  Right("${appDocumentsDir.path}/$idCarFix.pdf");
    } on DioException catch(e) {
      return Left(ServerFailure.fromDioError(e));
    } catch(e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> sendReview(int idCarFix, String review)
  async
  {
    try
    {
      Response response =
      await DioHelper.
      postData(url: "${EndPoint.CAR_FIXES_REVIEW}/$idCarFix" ,
      data:
      {
        "content" : review
      }
      );
      return  Right(true);
    } on DioException catch(e) {
      return Left(FailureLocal(message: e.toString()));
    } catch(e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }
}