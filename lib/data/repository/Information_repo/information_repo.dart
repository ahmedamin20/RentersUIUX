import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/helpers/dio_helpers/dio_helpers.dart';
import '../../../core/services/error/failuar.dart';
import '../../model/get_info_data_model/get_info_data_model.dart';
import '../../model/terms_and_condatioon_model/terms_and_condation_model.dart';

abstract class InformationRepo
{

  Future<Either<Failure , TermsAndCondationModel>>
  getTermsAndCondation();
  Future<Either<Failure , GetInfoDataModel>> getInfoData();

}
class InformationRepoImpl extends InformationRepo
{
  @override
  Future<Either<Failure, TermsAndCondationModel>>
  getTermsAndCondation()
  async
  {
    try
    {
      Response response = await DioHelper.
      getData(
        url: "users/terms_and_conditions",

      );
      return  Right(TermsAndCondationModel.fromJson(response.data));
    } on DioException catch(dioError)
    {
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetInfoDataModel>> getInfoData()
  async
  {
    try
    {
      Response response = await DioHelper.
      getData(
        url: "admin/settings",

      );
      return  Right(GetInfoDataModel.fromJson(response.data));
    } on DioException catch(dioError)
    {
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }
}