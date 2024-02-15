
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/services/app_router.dart';
import 'package:ksb/data/repository/car_fixes_repo/car_fixes_repo.dart';
import 'package:ksb/view_model/cubit/car_fixes_cubit/car_fixes_cubit.dart';


class NotificationController {
  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here

    // Navigate into pages, avoiding to open the notification details page over another details page already opened
    print("onActionReceivedMethod");
    // AppRouter.ctx!.push(
    //     AppRouter.cardetails,
    //     extra:
    //     {
    //       'id': int.parse(receivedAction.body!),
    //       "cubit" : CarFixesCubit(sl<CarFixesRepoImpl>()),
    //       "carName" : "car Fix"
    //     }
    // );
    // GoRouter.of(MyApp.navigatorKey.currentContext!).go('/car_details');
    print("Amr");
  }
}
