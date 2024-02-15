part of 'user_chat_cubit.dart';

@immutable
abstract class UserChatState {}

class UserChatInitial extends UserChatState {}

class UserChatLoading extends UserChatState {}

class UserChatSuccess extends UserChatState {
  final GetUserChatsModel getUserChatsModel;

  UserChatSuccess(this.getUserChatsModel);
}

class UserChatError extends UserChatState {
  final String error;

  UserChatError(this.error);
}

class DeleteChatStateLoading extends UserChatState {}

class DeleteChatStateSuccess extends UserChatState {
  DeleteChatStateSuccess();
}

class DeleteChatStateError extends UserChatState {
  final String error;

  DeleteChatStateError(this.error);
}

class UpdateUiScreen extends UserChatState {}

class SearchUserSataLoading extends UserChatState {}

class SearchUserSataSuccess extends UserChatState {
  SearchUserSataSuccess();
}

class SearchUserSataError extends UserChatState {
  final String error;

  SearchUserSataError(this.error);
}
