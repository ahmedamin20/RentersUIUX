import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:ksb/core/caching_data/cacshing_date.dart';
import '../../../core/helper/pusher_helper/pusher_helper.dart';
import '../../../model/get_message_model/response_message_model/response_messaeg_model.dart';
import '../../../model/get_user_chats_model/get_user_chats_model.dart';
import '../chat_cubit.dart';
import '../users_chat_cubit/user_chat_cubit.dart';
part 'bind_state.dart';

class BindCubit extends Cubit<BindState> {
  BindCubit() : super(BindInitial());

  Future<void> onInit(BuildContext context) async {
    PusherHelper.pusherHelper.bind('UserChatEvent', (event) {
      print("UserChatEvent");
      print(event!.data);
      Map<String, dynamic> data = jsonDecode(event.data!);
      UserChatCubit.get(context).newMessageChat(ChatUserModel.fromJson(data));
    });
    PusherHelper.pusherHelper.bind('MessageSentEvent', (event) {
      print("MessageSentEvent");
      print(event!.data);
      Map<String, dynamic> data = jsonDecode(event.data!);
      ChatCubit.get(context).addMessages(ResponseMessageModel.fromJson(data));
    });

    PusherHelper.pusherHelper.bind('MessageDeleted', (event) {
      print("MessageDeleted");
      print(event!.data);
      Map<String, dynamic> data = jsonDecode(event.data!);

      for (var message in ChatCubit.get(context).messages) {
        if (message.id == data['messageId']) {
          ChatCubit.get(context).deleteMessageAll(message.id);
        }
      }
    });

  }

  void subscribe(BuildContext context) async
  {

   await PusherHelper.pusherHelper.getPusherInit();
   await PusherHelper.pusherHelper.subscribe3(
        'private-notifications.users.${CachingData.instance.getCachedLogin()!.data!.id}');
   await PusherHelper.pusherHelper.subscribe(
        'private-support-chat.${CachingData.instance.getCachedLogin()!.data!.id}');
          onInit(context);

    // PusherHelper.pusherHelper.subscribe(
    //     'private-support-chat.${CachingData.instance.getCachedLogin()!.data!.id}');
    // PusherHelper.pusherHelper.subscribe3(
  }
// void bindEvent(BuildContext context)
// {
//
//
//   PusherHelper.pusherHelper.bind2('pusher_internal:member_added', (event) {
//     print(event!.data);
//     print("///////////////////////");
//     print(event.data!.split(":").last);
//
//     // Map<String, dynamic> map = jsonDecode(event.data!);
//     // UserChatCubit.get(context).onlineOfflineUser(map['user_id'], false);
//   });
//   PusherHelper.pusherHelper.bind2('pusher_internal:member_removed', (event) {
//     print(event!.data);
//     print(event.data!.split(":").last);
//     // Map<String, dynamic> map =
//     // jsonDecode(event.data!);
//     // print(map);
//     // UserChatCubit.get(context).onlineOfflineUser(map['user_id'], true);
//   });
// }


}
