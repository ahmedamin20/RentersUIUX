part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class StartAudioState extends ChatState {}

class StopAudio extends ChatState {}

class StartWriteState extends ChatState {}

class ToggleEmojiState extends ChatState {}

// send Message States
class SendMessageLoadingState extends ChatState {}

class SendMessageSuccessfullyState extends ChatState {
  ResponseMessageModel responseMessageModelOld;
  ResponseMessageModel responseMessageModelNew;

  SendMessageSuccessfullyState(
      this.responseMessageModelNew, this.responseMessageModelOld);
}

class SendMessageFailedState extends ChatState {
  final String error;

  SendMessageFailedState(this.error);
}

class AddToMessageListState extends ChatState {}

class ChangeLocalMessageeToRemoteMessageState extends ChatState {}

class GetMessagesLoadingState extends ChatState {}

class GetMessagesSuccessfullyState extends ChatState {
  final GetAllMessageModel messages;

  GetMessagesSuccessfullyState(this.messages);
}

class GetMessagesFailedState extends ChatState {
  final String error;

  GetMessagesFailedState(this.error);
}

class AddMessagesState extends ChatState {}

class DeleteMessageState extends ChatState {
  DeleteMessageState();
}

//
class MakeAllMessageSeenLoadingState extends ChatState {}

class MakeAllMessageSeenSuccessfullyState extends ChatState {
  final String message;

  MakeAllMessageSeenSuccessfullyState(this.message);
}

class MakeAllMessageSeenFailedState extends ChatState {
  final String error;

  MakeAllMessageSeenFailedState(this.error);
}

class DeleteMessageLoadingState extends ChatState {}

class DeleteMessageSuccessfullyState extends ChatState {
  int index;

  DeleteMessageSuccessfullyState(this.index);
}

class DeleteMessageFailedState extends ChatState {
  final String error;

  DeleteMessageFailedState(this.error);
}

class ChangeAudioState extends ChatState {}
