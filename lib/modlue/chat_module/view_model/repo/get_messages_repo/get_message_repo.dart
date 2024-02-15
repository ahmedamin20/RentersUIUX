import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/helpers/dio_helpers/dio_helpers.dart';
import '../../../core/failure/Failure.dart';
import '../../../model/get_message_model/get_all_message_model/get_all_message_model.dart';

abstract class GetMessagesRepo {
  Future<Either<Failure, GetAllMessageModel>> getMessages(
      {required String userId, required int page});

  Future<Either<Failure, bool>> deleteMessage(
      {required String messageId, required int deleteForAll});
}

class GetMessagesRepoImpl extends GetMessagesRepo {
  @override
  Future<Either<Failure, GetAllMessageModel>> getMessages(
      {required String userId, required int page}) async {
    try {
      Response response = await DioHelper.getData(
          url: "/support_chat/messages?page=$page",
          queryParameters: {
            "per_page": 25,
          });
      print(response.data);
      return Right(GetAllMessageModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      print("////////////////////////////////////");
      print(e);
      print("////////////////////////////////////");
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteMessage(
      {required String messageId, required int deleteForAll}) async {
    try {
      Response response = await DioHelper.deleteData(
        url:
            "/support_chat/messages/$messageId?delete_for_all=${deleteForAll.toString()}",
      );
      print(response.data);
      return Right(true);
    } on DioException catch (e) {
      print("////////////////////////////////////");
      print(e);
      print("////////////////////////////////////");
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      print("////////////////////////////////////");
      print(e);
      print("////////////////////////////////////");
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
