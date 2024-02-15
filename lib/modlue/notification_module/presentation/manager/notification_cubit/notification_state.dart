part of 'notification_cubit.dart';

@immutable
abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoadingState extends NotificationState {}

class NotificationSuccessState extends NotificationState {
  final noteModel.NotificationModel notificationModel;

  NotificationSuccessState(this.notificationModel);
}

class NotificationErrorState extends NotificationState {
  final String error;

  NotificationErrorState(this.error);
}
////////////////////////////////////////////////////////////////////////

class NotificationAllSeenSuccessState extends NotificationState {

  NotificationAllSeenSuccessState();
}
////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////

class NotificationSeenOneSuccessState extends NotificationState {

  int index;
  NotificationSeenOneSuccessState(this.index);
}
////////////////////////////////////////////////////////////////////////


class NotificationOneDeleteSuccessState extends NotificationState {
  int index;
  NotificationOneDeleteSuccessState(this.index);
}
///////////////////////////////////////////
class NotificationActionLoading extends NotificationState
{

}
class NotificationAllDeleteSuccessState extends NotificationState {

  NotificationAllDeleteSuccessState();
}
class NotificationActionError extends NotificationState{
  final String error;

  NotificationActionError(this.error);
}


class GetNotificationCountSuccessState extends NotificationState {

  int count;
  GetNotificationCountSuccessState(this.count);
}
class GetNotificationCountErrorState extends NotificationState {
  final String error;

  GetNotificationCountErrorState(this.error);
}