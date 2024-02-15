import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/constants.dart';
// import 'package:appinio_video_player/appinio_video_player.dart';
import '../../../core/helper/create_local_id_random/create_local_id_random.dart';
import '../../../model/model_send_messages/send_message_model.dart';
import '../../../view_model/cubit/chat_cubit.dart';

class ShowImageScreen extends StatefulWidget {
  const ShowImageScreen({super.key, required this.imagePath, required this.id});

  final String imagePath;
  final String id;

  @override
  State<ShowImageScreen> createState() => _ShowImageScreenState();
}

class _ShowImageScreenState extends State<ShowImageScreen> {
  // VideoPlayerController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // if (!imageExtensions.contains(widget.imagePath.split('.').last)) {
    //   controller = VideoPlayerController.file(File(widget.imagePath))
    //     ..initialize().then((_) {
    //       setState(() {});
    //     });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        if (state is AddToMessageListState) {
          Navigator.pop(context);
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                (imageExtensions.contains(widget.imagePath.split('.').last))
                    ? SizedBox(
                        child: Image.file(
                          File(widget.imagePath),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      )
                    : SizedBox(),
                // : controller!.value.isInitialized
                //     ? AspectRatio(
                //         aspectRatio: controller!.value.aspectRatio,
                //         child: ShowVideo(
                //           videoUrl: controller!,
                //         ),
                //       )
                //     : const Center(child: CircularProgressIndicator()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                ),
                                child: TextFormField(
                                  controller: ChatCubit.get(context)
                                      .captionImageMessage,
                                  maxLines: 5,
                                  minLines: 1,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.add_a_photo_outlined,
                                      color: Colors.white,
                                    ),
                                    hintText: 'Add Caption',
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 9.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              backgroundColor: Colors.black.withOpacity(0.5),
                              radius: 25,
                              child: IconButton(
                                onPressed: () {
                                  SendMessageModel sendMessageModel =
                                      SendMessageModel(
                                    body: ChatCubit.get(context)
                                        .captionImageMessage
                                        .text,
                                    createdAt: DateTime.now().toString(),
                                    toUserId: widget.id,
                                    media: widget.imagePath,
                                    localId: generateRandomId(5),
                                    cachedMediaPath: widget.imagePath,
                                  );
                                  ChatCubit.get(context).sendMessage(
                                    sendMessageModel: sendMessageModel,
                                    type: "image",
                                  );
                                  ChatCubit.get(context)
                                      .captionImageMessage
                                      .clear();
                                },
                                icon: const Center(
                                  child: Icon(
                                    Icons.send,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
      },
    );
  }
}
