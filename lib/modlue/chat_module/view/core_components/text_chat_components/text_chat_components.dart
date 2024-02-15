import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/constants.dart';
import '../../../core/helper/know_is_video/know_is_video.dart';
import '../../../model/get_message_model/response_message_model/response_messaeg_model.dart';
import '../../../view_model/cubit/chat_cubit.dart';
import '../../../view_model/cubit/users_chat_cubit/user_chat_cubit.dart';
import '../../pages/normal_image.dart';
import '../text_message_components/text_message_components.dart';
import '../video_components/video_components.dart';
import '../voice_widget/voic_widget.dart';

class ChatComponents extends StatelessWidget {
  const ChatComponents({
    super.key,
    required this.isMe,
    required this.message,
    required this.index,
  });

  final bool isMe;
  final ResponseMessageModel message;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserChatCubit, UserChatState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is DeleteMessageLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return GestureDetector(
            onLongPress: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(
                        "Are you sure you want to delete this message?"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel")),
                      TextButton(
                        onPressed: () {
                          ChatCubit.get(context).deleteMessage(
                              messageID: message.id!,
                              index: index,
                              deleteForMe: 0);
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(primary: Colors.red),
                        child: const Text("Delete Message from me"),
                      ),
                      !message.fromLoggedUser!
                          ? const SizedBox()
                          : TextButton(
                              onPressed: () {
                                ChatCubit.get(context).deleteMessage(
                                    messageID: message.id!,
                                    index: index,
                                    deleteForMe: 1);
                                Navigator.pop(context);
                              },
                              style: TextButton.styleFrom(primary: Colors.red),
                              child: const Text("Delete Message from All"),
                            ),
                    ],
                  );
                },
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildMessage(
                    responseMessageModel: message,
                    isMe: isMe,
                    message: message.attachments!.isEmpty ||
                            message.attachments == null
                        ? message.body.toString()
                        : message.attachments![0].url.toString(),
                    type: message.attachments?.isEmpty ?? true
                        ? "text"
                        : getMediaType(
                                message.attachments![0].url!.split('.').last)
                            .toLowerCase()),
              ],
            ),
          );
        }
      },
    );
  }
}

Widget buildMessage({
  required bool isMe,
  required String message,
  required String type,
  required ResponseMessageModel responseMessageModel,
}) {
  if (message.split('.').last == "mp3" ||
      message.split('.').last == "m4a" ||
      message.split('.').last == "wav" ||
      message.split('.').last == "aac") {
    return AudioChatBuble(
      sender: isMe,
      audio: message,
    );
  } else if (type == "video") {
    return  VideoApp(
id: responseMessageModel.isLocal
          ? responseMessageModel.localId.toString()
          : responseMessageModel.id.toString(),
      image: Image.asset(
        "assets/images/video.png",
        fit: BoxFit.cover,
      ),
      isSender: isMe,
      videoUrl: message,
      sent: responseMessageModel.isLocal ? false : true,
      delivered: responseMessageModel.isLocal ? true : false,
      seen: responseMessageModel.seen!,
      time: DateFormat.jm().format((DateTime.now())).toString(),
    );
  } else if (type == "image") {
    return BubbleNormalImageUpdate(
      seen: responseMessageModel.seen!,
      caption: responseMessageModel.body.toString(),
      time: DateFormat.jm().format((DateTime.now())).toString(),
      id: responseMessageModel.isLocal
          ? responseMessageModel.localId.toString()
          : responseMessageModel.id.toString(),
      image: message.contains('https')
          ? CachedNetworkImage(
              imageUrl: message,
              imageBuilder: (context, imageProvider) =>
                  Image.network(message, fit: BoxFit.cover),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            )
          : Image.file(
              File(message),
              fit: BoxFit.cover,
            ),
      color: isMe ? primaryColor! : Colors.white,
      tail: true,
      delivered: responseMessageModel.isLocal ? true : false,
      sent: responseMessageModel.isLocal ? false : true,
      isSender: isMe,
    );
  } else {
    return BubbleSpecialThree(
      text: message,
      seen: responseMessageModel.seen!,
      color: isMe ? primaryColor! : Colors.white,
      tail: true,
      textStyle: TextStyle(
        fontSize: 16,
        color: isMe ? Colors.white : Colors.black,
      ),
      isSender: isMe,
      delivered: responseMessageModel.isLocal ? true : false,
      sent: responseMessageModel.isLocal ? false : true,
      time: DateFormat.jm().format((DateTime.now())).toString(),
    );
  }
}
