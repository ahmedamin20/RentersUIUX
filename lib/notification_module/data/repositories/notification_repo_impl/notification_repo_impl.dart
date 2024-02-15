import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ksb/core/helpers/dio_helpers/end_points.dart';

import '../../../../core/helpers/dio_helpers/dio_helpers.dart';
import '../../../../core/services/error/failuar.dart';
import '../../../domain/repositories/notification_repo.dart';
import '../../models/notification_model.dart';

class NotificationRepoImpl extends NotificationRepo {
  @override
  Future<Either<Failure, NotificationModel>> getNotifications(int page) async
  {
    try {
      Response response = await DioHelper.getData(
          url: EndPoint.GET_NOTIFICATION_END_POINT,
          queryParameters: {'page': page});
      return Right(NotificationModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> seenAllNotification() async
  {
    try {
      Response response = await DioHelper.patchData(
          url: EndPoint.GET_NOTIFICATION_END_POINT,
          data: {}
      );
      return const Right(true);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }
  @override
  Future<Either<Failure, bool>> seenOneNotification(String id)
  async
  {
    try {
      Response response = await DioHelper.patchData(
          url: "${EndPoint.GET_NOTIFICATION_END_POINT}/$id",
          data: {}
      );
      return const Right(true);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteAllNotification()
 async
 {
    try {
      Response response = await DioHelper.deleteData(
          url: EndPoint.GET_NOTIFICATION_END_POINT,
      );
      return const Right(true);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteOneNotification(String id)
 async
 {
    try {
      Response response = await DioHelper.deleteData(
          url: "${EndPoint.GET_NOTIFICATION_END_POINT}/$id",
          data: {}
      );
      return const Right(true);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> getNotificationCount()
  async
  {
    try {
      Response response = await DioHelper.getData(
          url: EndPoint.GET_UNREAD_COUNT_NOTIFICATION,

      );
      return  Right(response.data['data']['unreadNotificationsCount']);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }



}
