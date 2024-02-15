import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../core/constants/constants.dart';
import '../../core/helper/create_local_id_random/create_local_id_random.dart';
import '../../core/helper/image_picker_helper/image_picker_helper.dart';
import '../../core/helper/pusher_helper/pusher_helper.dart';
import '../../model/model_send_messages/send_message_model.dart';
import '../../view_model/cubit/chat_cubit.dart';
import '../pages/show_image_screen/show_image_screen.dart';

class CustomSendMessages extends StatefulWidget {
  const CustomSendMessages({super.key, required this.userID});

  final String userID;

  @override
  State<CustomSendMessages> createState() => _CustomSendMessagesState();
}

class _CustomSendMessagesState extends State<CustomSendMessages>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ChatCubit.get(context).focusNode.addListener(()
    {
      if(ChatCubit.get(context).focusNode.hasFocus)
        {
          if(ChatCubit.get(context).emoji)
            {
              ChatCubit.get(context).toggleEmoji();
            }
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      buildWhen: (previous, current) {
        if (current is StartAudioState ||
            current is StartWriteState ||
            current is StopAudio) {
          return true;
        }
        return false;
      },
      listener: (context, state) {
        if (state is SendMessageSuccessfullyState)
        {
          // customTimerController.reset();
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        ChatCubit cubit = ChatCubit.get(context);
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            margin: const  EdgeInsets.all(8),
            child:  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onTapOutside: (event)
                          {
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          style: TextStyle(
                            fontSize: 14,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          focusNode: cubit.focusNode,
                          controller: cubit.messageController,
                          textDirection: cubit.isArabicLang
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          onChanged: (value) {
                            cubit.startWrite();
                          },
                          onTap: () {
                            // PusherHelper.pusherHelper.channel2!
                            //     .trigger('client-typing', {
                            //   "from_user": CacheHelper.get(key: 'userID'),
                            //   "to_user": widget.userID,
                            // });
                            if (cubit.emoji) {
                              cubit.toggleEmoji();
                            }
                          },
                          minLines: 1,
                          maxLines: 7,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: primaryColor!),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: primaryColor!),
                                  borderRadius: BorderRadius.circular(10)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: primaryColor!),
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Type a message',
                              prefixIcon: InkWell(
                                  onTap: () {
                                    cubit.focusNode.unfocus();
                                    cubit.toggleEmoji();
                                  },
                                  child: Icon(
                                    Icons.emoji_emotions,
                                    color: primaryColor!,
                                  )),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () async {
                                      ImagePickerHelper.imagePickerHelper
                                          .pickImageVideoUser()
                                          .then((value) {
                                        if (ImagePickerHelper
                                                .imagePickerHelper.file !=
                                            null) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ShowImageScreen(
                                                        id: widget.userID,
                                                        imagePath:
                                                            ImagePickerHelper
                                                                .imagePickerHelper
                                                                .file!
                                                                .path,
                                                      )));
                                        }
                                      });
                                    },
                                    icon: Icon(
                                      Icons.photo,
                                      color: primaryColor!,
                                    ),
                                  ),
                                  Center(
                                    child: IconButton(
                                      onPressed: () {
                                        ImagePickerHelper.imagePickerHelper
                                            .pickImageCamera()
                                            .then((value) {
                                          if (value != null) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context)
                                                    =>
                                                        ShowImageScreen(
                                                          id: widget.userID,
                                                          imagePath: value.path,
                                                        )));
                                          }
                                        });
                                      },
                                      icon: Icon(
                                        Icons.camera_alt,
                                        color: primaryColor!,
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ),
                      const
                      SizedBox(
                        width: 10,
                      ),
                      // (cubit.messageController.text != '')

                        CircleAvatar(
                              backgroundColor: primaryColor!,
                              radius: 20,
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    if(cubit.messageController.text.isEmpty)
                                    {
                                      return;
                                    }
                                    SendMessageModel sendMessageModel =
                                        SendMessageModel(
                                            body: cubit.messageController.text,
                                            toUserId: widget.userID,
                                            createdAt:
                                                DateTime.now().toString(),
                                            localId: generateRandomId(5));
                                    cubit.sendMessage(
                                        sendMessageModel: sendMessageModel,
                                        type: "text");

                                    cubit.messageController.clear();
                                    cubit.startWrite();
                                  },
                                  icon: const Icon(
                                    Icons.send,
                                    color: Colors.white,
                                  ),
                                ),
                              ),)

                    ],
                  ),
          ),
        );
      },
    );
  }
}
