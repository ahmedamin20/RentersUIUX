import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksb/data/model/user_model/user_model.dart';
import '../../../core/constants/constants.dart';
import '../../../model/get_user_chats_model/get_user_chats_model.dart';
import '../../../view_model/cubit/chat_cubit.dart';
import '../../../view_model/cubit/users_chat_cubit/user_chat_cubit.dart';
import '../../core_components/custom_send_messge.dart';
import '../../core_components/emoji_components.dart';
import '../../core_components/text_chat_components/text_chat_components.dart';

class ChatBetweenUserScreen extends StatefulWidget
{
  const ChatBetweenUserScreen({
    super.key,
    required this.userID,
    required this.chatUserModel,
    this.primaryColor,
    required this.userModel,
  });

  final String userID;
  final Color? primaryColor;
  final ChatUserModel chatUserModel;
  final UserModel userModel ;

  @override
  State<ChatBetweenUserScreen> createState() => _ChatBetweenUserScreenState();
}

class _ChatBetweenUserScreenState extends State<ChatBetweenUserScreen>
{
  final ScrollController _scrollController = ScrollController();

  @override
  void initState()
  {
    globalUserModel = widget.userModel;

    // TODO: implement initState
    super.initState();
    primaryColor = widget.primaryColor ?? primaryColor;
    int page = 1;
    ChatCubit.get(context).makeAllMessageSeen(userID: widget.userID);

    ChatCubit.get(context).getMessage(id: widget.userID);

    _scrollController.addListener(()
    {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent)
      {
        page++;
        if (page <= ChatCubit.get(context).lastPage!)
        {
          ChatCubit.get(context).getMessage(id: widget.userID, page: page);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: const Color(0xffEDEDED),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        titleSpacing: 0.0,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: CachedNetworkImage(
                        imageUrl: widget.chatUserModel.avatar!,
                      ),
                    );
                  },
                );
              },
              child: CircleAvatar(
                radius: 20.0,
                backgroundImage:
                    CachedNetworkImageProvider(widget.chatUserModel.avatar!),
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Text(
              widget.chatUserModel.name!,
              style: TextStyle(
                color: primaryColor,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child:  BlocConsumer<ChatCubit, ChatState>(
            listener: (context, state) {
              if (state is MakeAllMessageSeenSuccessfullyState)
              {
                UserChatCubit.get(context).userChats.forEach((element) {
                  if (element.otherUserId == int.parse(widget.userID)) {
                    element.unseenMessagesCount = 0;
                  }
                });
              }
              // TODO: implement listener
              if (state is SendMessageSuccessfullyState) {
                sendMessageSuccess(state);

              }
            },
            builder: (context, state) {
              ChatCubit cubit = ChatCubit.get(context);
              return SafeArea(
                  child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 12,
                            ),
                        controller: _scrollController,
                        reverse: true,
                        itemCount: cubit.messages.length,
                        cacheExtent: 500,
                        itemBuilder: (context, index) {
                          return Align(
                            alignment:
                                cubit.messages[index].fromLoggedUser ?? true
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                            child: ChatComponents(
                              index: index,
                              isMe:
                                  cubit.messages[index].fromLoggedUser ?? true,
                              message: cubit.messages[index],
                            ),
                          );
                        }),
                  ),

                  CustomSendMessages(
                    userID: widget.userID,
                  ),
                  //  Emoji
                  const EmojiComponents(),
                ],
              ));
            },
          ),
        ),
      ),
    );
  }
  void sendMessageSuccess(SendMessageSuccessfullyState state)
  {

    bool found = false;
    // update chat of user
    UserChatCubit.get(context).updateChat(
        widget.chatUserModel, state.responseMessageModelNew);
    // notify the message is done
    ChatCubit.get(context).removeAddReplace(
        state.responseMessageModelOld,
        state.responseMessageModelNew);
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );

  }
}
