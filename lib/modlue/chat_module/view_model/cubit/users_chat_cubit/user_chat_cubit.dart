import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/get_message_model/response_message_model/response_messaeg_model.dart';
import '../../../model/get_user_chats_model/get_user_chats_model.dart';
import '../../../model/search_model/search_model.dart';
import '../../repo/get_users_chat_repo/get_user_chat_repo.dart';

part 'user_chat_state.dart';

class UserChatCubit extends Cubit<UserChatState> {
  UserChatCubit(this.getUserChatRepo) : super(UserChatInitial());

  static UserChatCubit get(context) => BlocProvider.of<UserChatCubit>(context);
  ChatRepo getUserChatRepo;
  List<ChatUserModel> userChats = [];
  TextEditingController searchController = TextEditingController();

  void onlineOfflineUser(int id, bool offLine) {
    for (var element in userChats) {
      if (id == element.otherUserId) {
        if (offLine) {
          element.lastTimeActive = DateTime.now();
          // getUserChatRepo.changeActive(id);
        } else {
          element.lastTimeActive = null;
        }
        break;
      }
    }
    emit(UserChatSuccess(GetUserChatsModel(data: userChats)));
  }

  void updateChat(
      ChatUserModel chatUserModel, ResponseMessageModel responseMessageModel) {
    int index = -1;
    bool isFound = false;
    for (var element in userChats) {
      index++;
      if (element.otherUserId == chatUserModel.otherUserId) {
        isFound = true;
        break;
      }
    }
    if (index != -1 && isFound) {
      userChats.removeAt(index);
      userChats.insert(
          0,
          chatUserModel.copyWith(
              createdAt: DateTime.now().toString(),
              messageBody: responseMessageModel.body,
              unseenMessagesCount: 0));
    } else {
      userChats.insert(
          0,
          chatUserModel.copyWith(
              createdAt: DateTime.now().toString(),
              messageBody: responseMessageModel.body,
              unseenMessagesCount: 0));
    }

    emit(UserChatSuccess(GetUserChatsModel(data: userChats)));
  }

  Future<void> getUserChat(int page) async {
    emit(UserChatLoading());
    final result = await getUserChatRepo.getUserChat(page);
    result.fold((error) {
      emit(UserChatError(error.message));
    }, (data) {
      if (page == 1) {
        userChats.clear();
      }
      userChats.addAll(data.data!);
      emit(UserChatSuccess(data));
    });
  }

  Future<void> newMessageChat(ChatUserModel chatUserModel) async {
    print("/////////////");
    print(chatUserModel.messageBody);
    print("/////////////");
    ChatUserModel? chatUserModelTwo;
    bool isFound = false;
    int i = -1;
    for (var element in userChats) {
      i++;
      if (element.otherUserId == chatUserModel.otherUserId) {
        chatUserModelTwo = element.copyWith(
          unseenMessagesCount: chatUserModel.unseenMessagesCount!,
          messageBody: chatUserModel.messageBody,
          otherUserId: chatUserModel.otherUserId,
          lastTimeActive: chatUserModel.lastTimeActive,
          fromLoggedUser: chatUserModel.fromLoggedUser,
          avatar: chatUserModel.avatar,
          name: chatUserModel.name,
          createdAt: chatUserModel.createdAt,
        );
        isFound = true;

        break;
      }
    }
    // print("last Message${chatUserModel!.messageBody}");
    if (isFound) {
      print(chatUserModelTwo!.messageBody);
      userChats.removeAt(i);
      userChats.insert(0, chatUserModelTwo);
    } else {
      chatUserModel.unseenMessagesCount = 1;
      userChats.insert(0, chatUserModel);
    }

    emit(UserChatSuccess(GetUserChatsModel(data: userChats)));
  }

  Future<void> deleteChat(
      {required int id, required int index, required int all}) async {
    emit(DeleteChatStateLoading());
    final result = await getUserChatRepo.deleteChat(id);
    result.fold((error) {
      emit(DeleteChatStateError(error.message));
    }, (data) {
      deleteChatList(index);
      emit(DeleteChatStateSuccess());
    });
  }

  void deleteChatList(int index) {
    userChats.removeAt(index);
    emit(UserChatSuccess(GetUserChatsModel()));
  }

  SearchModel? searchModel;

  Future<void> searchUser(String text, int page) async {
    emit(SearchUserSataLoading());
    final result = await getUserChatRepo.search(text, page);
    result.fold((error) {
      emit(SearchUserSataError(error.message));
    }, (data) {
      if (page == 1) {
        searchModel = data;
      } else {
        searchModel!.data!.addAll(data.data!);
      }
      emit(SearchUserSataSuccess());
    });
  }
}
