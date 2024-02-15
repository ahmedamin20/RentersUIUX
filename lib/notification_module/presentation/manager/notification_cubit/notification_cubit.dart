import 'dart:convert';
import 'dart:math' as math;

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../core/caching_data/cacshing_date.dart';
import '../../../../core/helpers/pusher_helper/pusher_helper.dart';
import '../../../data/models/notification_model.dart' as noteModel;
import '../../../data/models/notification_model.dart';
import '../../../domain/repositories/notification_repo.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState>
{
  NotificationCubit(this._notificationRepo) : super(NotificationInitial());

  static NotificationCubit get(context) => BlocProvider.of(context);
  NotificationRepo _notificationRepo;
  int page = 1;
  noteModel.NotificationModel? notificationModel;
  int count = 0;
  Future<void> getNotification({bool? reset}) async {
    if(reset!=null)
      {
        page = 1;
      }
    if (page == 1)
    {
      notificationModel = null;
      emit(NotificationLoadingState());
    }
    final response = await _notificationRepo.getNotifications(page);
    response.fold((l) {
      emit(NotificationErrorState(l.message));
    }, (r) {
      if (page == 1) {
        notificationModel = r;
      } else {
        notificationModel!.data!.addAll(r.data!);
      }
      page++;
      emit(NotificationSuccessState(r));
    });
  }
  Future<void> getNotificationCount() async
  {
    emit(NotificationActionLoading());
    final response = await _notificationRepo.getNotificationCount();
    response.fold((l) {
      emit(GetNotificationCountErrorState(l.message));
    }, (r) {
      count = r;
      emit(GetNotificationCountSuccessState(count));
    });
  }


  Future<void> seenAllNotification() async
  {
    emit(NotificationActionLoading());
    final response = await _notificationRepo.seenAllNotification();
    response.fold((l) {
      emit(NotificationActionError(l.message));
    }, (r) {
      emit(NotificationAllSeenSuccessState());
    });
  }
  Future<void> seenOneNotification(String id , int index) async
  {
    emit(NotificationActionLoading());
    final response = await _notificationRepo.seenOneNotification(id);
    response.fold((l) {
      emit(NotificationActionError(l.message));
    }, (r) {
      emit(NotificationSeenOneSuccessState(index));
    });
  }
  Future<void> deleteAllNotification() async
  {
    emit(NotificationActionLoading());
    final response = await _notificationRepo.deleteAllNotification();
    response.fold((l) {
      emit(NotificationActionError(l.message));
    }, (r) {
      emit(NotificationAllDeleteSuccessState());
    });
  }
  Future<void> deleteOneNotification(String id , int index)
  async
  {
    emit(NotificationActionLoading());
    final response = await _notificationRepo.deleteOneNotification(id);
    response.fold((l) {
      emit(NotificationActionError(l.message));
    }, (r) {
      emit(NotificationOneDeleteSuccessState(index));
    });
  }
  void subscribe() async
  {
    // CachingData.gloablLoginData.user.id;

    PusherHelper.pusherHelper.getPusherInit();
    PusherHelper.pusherHelper.subscribe(
        'private-notifications.users.${CachingData.instance.getCachedLogin()?.data?.id
        }' );
    // print("private-support-chat.$id");
    // presence-chat
    // PusherHelper.pusherHelper.subscribe2('presence-chat');
  }
  Future<void> bindNotification() async
  {
    PusherHelper.pusherHelper.bind(
        "Illuminate\\Notifications\\Events\\BroadcastNotificationCreated",
        (event) {
      print("Illuminate\Notifications\Events\BroadcastNotificationCreated");
      print(event!.data);
      NotificationModelData data =
          NotificationModelData.fromJson(jsonDecode(event!.data!));


        AwesomeNotifications().createNotification(
            content: NotificationContent(
          id: math.Random().nextInt(100),
          channelKey: 'basic_channel',
          actionType: ActionType.Default,
          title: data.body!.message,
          body: data.body!.modelId.toString(),
        ));
        if (notificationModel == null) {
          getNotification();
        } else {
          notificationModel!.data!.insert(0, data);
          emit(NotificationSuccessState(noteModel.NotificationModel.fromJson(
              notificationModel!.toJson())));
        }

    });
  }
}
