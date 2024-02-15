import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/helpers/dio_helpers/dio_helpers.dart';
import '../../../core/failure/Failure.dart';
import '../../../model/get_user_chats_model/get_user_chats_model.dart';
import '../../../model/search_model/search_model.dart';

abstract class ChatRepo {
  Future<Either<Failure, GetUserChatsModel>> getUserChat(
    int page,
  );

  Future<Either<Failure, String>> deleteChat(
    int chatId,
  );

  Future<Either<Failure, String>> changeActive(int userId, int activeNonactive);

  Future<Either<Failure, SearchModel>> search(String search, int page);
}

class GetUserChatRepoImpl implements ChatRepo {
  @override
  Future<Either<Failure, GetUserChatsModel>> getUserChat(int page) async {
    try {
      Response response = await DioHelper.getData(
        url: "/support_chat/messages?page=$page",
      );
      return Right(GetUserChatsModel.fromJson(response.data));
    } on DioException catch (e) {
      print(e.response!.data);

      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      print(e);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteChat(int chatId) async {
    try {
      Response response = await DioHelper.deleteData(
        url: "/chat/chats/$chatId",
      );
      return Right(response.data.toString());
    } on DioException catch (e) {
      print(e.response!.data);
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      print(e);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> changeActive(
      int userId, int activeNonactive) async {
    try {
      Response response = await DioHelper.patchData(
        url: "chat/users",
        data: {
          "active": activeNonactive,
        },
      );
      return Right(response.data.toString());
    } on DioException catch (e) {
      print(e.response!.data);
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      print(e);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SearchModel>> search(String search, int page) async {
    try {
      Response response = await DioHelper.getData(
        url: 'chat/users?handle=$search',
        queryParameters: {"page": page},
      );
      return Right(SearchModel.fromJson(response.data));
    } on DioException catch (e) {
      print(e.response!.data);
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      print(e);
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
