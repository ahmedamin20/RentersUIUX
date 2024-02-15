import 'package:dartz/dartz.dart';
import 'package:ksb/core/services/error/failuar.dart';

import '../../data/models/notification_model.dart';

abstract class NotificationRepo {
  Future<Either<Failure, NotificationModel>> getNotifications(int page);
  Future<Either<Failure , bool>> seenAllNotification();
  Future<Either<Failure , int>> getNotificationCount();
  Future<Either<Failure , bool>> seenOneNotification(String id);
  Future<Either<Failure , bool>> deleteOneNotification(String id);
  Future<Either<Failure , bool>> deleteAllNotification();


}
