import 'dart:io' as io;

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/helper/audio_helper/audio_helper.dart';
import '../../model/get_message_model/attachment_response_model/attachment_response_model.dart';
import '../../model/get_message_model/get_all_message_model/get_all_message_model.dart';
import '../../model/get_message_model/response_message_model/response_messaeg_model.dart';
import '../../model/model_send_messages/send_message_model.dart';
import '../../view/core_components/voice_widget/voic_widget.dart';
import '../repo/get_messages_repo/get_message_repo.dart';
import '../repo/make_alll_message_seen_repo/make_alll_message_seen_repo.dart';
import '../repo/send_message_repo/send_message_repo.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(
      {required this.sendMessageRepo,
      required this.getMessagesRepo,
      required this.makeAllMessageSeenRepo})
      : super(ChatInitial());

  static ChatCubit get(context) => BlocProvider.of<ChatCubit>(context);
  SendMessageRepo sendMessageRepo;
  GetMessagesRepo getMessagesRepo;
  MakeAllMessageSeenRepo makeAllMessageSeenRepo;
  TextEditingController messageController = TextEditingController();
  TextEditingController captionImageMessage = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool emoji = false;
  AudioPlayer audioPlayer = AudioPlayer();

  // Response message List
  List<ResponseMessageModel> messages = [];

  void addMessages(ResponseMessageModel responseMessageModel) {
    messages.insert(0, responseMessageModel.copyWith(fromLoggedUser: false));
    emit(AddMessagesState());
  }

  void deleteMessageAll(int idMessage) {
    messages.removeWhere((element) => element.id == idMessage);
    emit(DeleteMessageState());
  }

  void startAudio() async {
    await AudioHelper.audioHelper.recordVoice();
    emit(StartAudioState());
  }

  void stopAudio() async {
    await AudioHelper.audioHelper.record!.stopRecorder();
    io.File file = io.File(AudioHelper.audioHelper.path);

    emit(StopAudio());
  }

  String getPathAudio() {
    return AudioHelper.audioHelper.path;
  }

  bool isArabicLang = false;

  void startWrite() {
    if (messageController.text.isNotEmpty) {
      isArabicLang = messageController.text.codeUnitAt(0) > 1000;
    } else {
      isArabicLang = false;
    }
    emit(StartWriteState());
  }

  void toggleEmoji() {
    emoji = !emoji;
    emit(ToggleEmojiState());
  }

  bool isNewDay(int index) {
    if (index == 0) return true; // First message is always a new day
    DateTime currentMessageDate = DateTime.parse(messages[index].createdAt!);
    DateTime previousMessageDate =
        DateTime.parse(messages[index - 1].createdAt!);
    // Compare the date parts (year, month, and day) of the current message with the previous message
    return currentMessageDate.year != previousMessageDate.year ||
        currentMessageDate.month != previousMessageDate.month ||
        currentMessageDate.day != previousMessageDate.day;
  }

  // send Message Function
  Future<void> sendMessage({
    required SendMessageModel sendMessageModel,
    required String type,
  }) async {
    // addToMessageList();
    //  MessageCubit messageCubit =
    //  MessageCubit(
    //      sendMessageRepo: sl<SendMessageRepoImpl>(),
    //    messages: messages
    //  );
    // await messageCubit.sendMessage(
    //     sendMessageModel:
    // sendMessageModel
    // );
    //  messageCubit.close();
    print("send Message");
    print(sendMessageModel.body);

    List<Attachments> attachments = [];
    if (sendMessageModel.media != null && sendMessageModel.media!.isNotEmpty) {
      attachments.add(
          Attachments(
        type: type,
        url: sendMessageModel.media!,
      ));
    }
    ResponseMessageModel responseMessageModelOld = ResponseMessageModel(
      body: sendMessageModel.body,
      createdAt: sendMessageModel.createdAt,
      attachments: attachments,
      toUserId: sendMessageModel.toUserId.toString(),
      localId: sendMessageModel.localId,
      fromLoggedUser: true,
      seen: false,
    );
    addToMessageList(responseMessageModel: responseMessageModelOld);

    emit(SendMessageLoadingState());

    final response =
        await sendMessageRepo.sendMessage(sendMessageRequest: sendMessageModel);
    response.fold((l) => emit(SendMessageFailedState(l.message)),
        (r) => emit(SendMessageSuccessfullyState(r, responseMessageModelOld)));
  }

  void addToMessageList({required ResponseMessageModel responseMessageModel}) {
    messages.insert(0, responseMessageModel);
    print("add To List");
    print(responseMessageModel.body);
    print("add To List");
    emit(AddToMessageListState());
  }

  void removeAddReplace(ResponseMessageModel responseMessageModelOld,
      ResponseMessageModel responseMessageModelNew) {
    print("///////name/////");
    print(responseMessageModelNew.body);
    print("///////name/////");

    int index = messages.indexOf(responseMessageModelOld);
    print(index);
    messages.removeAt(index);
    messages.insert(index, responseMessageModelNew);
    for (var element in messages) {
      print("remote id ${element.localId}");
      print("local ID ${responseMessageModelOld.localId}");
      if (element.localId == responseMessageModelOld.localId) {
        print("Text  ${element.body}");
        element.isLocal = true;
      }
    }
    emit(ChangeLocalMessageeToRemoteMessageState());
  }

  int? lastPage;

  Future<void> getMessage({
    String? id,
    int page = 1,
  }) async {
    emit(GetMessagesLoadingState());
    if (page == 1) {
      messages.clear();
    }
    final response = await getMessagesRepo.getMessages(userId: id!, page: page);
    response.fold((l) => emit(GetMessagesFailedState(l.message)), (r) {
      messages.addAll(r.data!);
      lastPage = r.meta!.lastPage!.toInt();
      emit(GetMessagesSuccessfullyState(r));
    });
  }

  Future<void> makeAllMessageSeen({
    required String userID,
  }) async {
    emit(MakeAllMessageSeenLoadingState());
    final response =
        await makeAllMessageSeenRepo.makeAllMessageSeen(userID: userID);
    response.fold((l) => emit(MakeAllMessageSeenFailedState(l.message)), (r) {
      emit(MakeAllMessageSeenSuccessfullyState(r));
    });
  }

  List<AudiPlayerModel> audioPlayers = [];

  Future<void> deleteMessage(
      {required String messageID,
      required int index,
      required int deleteForMe}) async {
    emit(DeleteMessageLoadingState());
    final response = await getMessagesRepo.deleteMessage(
        messageId: messageID, deleteForAll: deleteForMe);
    response.fold((l) => emit(DeleteMessageFailedState(l.message)), (r) {
      messages.removeAt(index);
      emit(DeleteMessageSuccessfullyState(index));
    });
  }

  void changeAudioState() {
    for (var value in audioPlayers) {
      value.audioPlayer.pause();
      value.widget.isPlaying = false;
      value.widget.isPause = true;
    }

    emit(ChangeAudioState());
  }
}

class AudiPlayerModel {
  AudioPlayer audioPlayer;
  AudioChatBuble widget;

  AudiPlayerModel({required this.audioPlayer, required this.widget});
}
