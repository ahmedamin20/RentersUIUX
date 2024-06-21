import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:ksb/views/pages/chat/domain/chat_api_services.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatCubitState> {
  ChatCubit() : super(ChatInitial());
  ApiServices apiServices = ApiServices();

  Future<void> sendChat(String message) async {
    emit(ChatLoading());
    try{
      final response = await apiServices.sendPostRequest(
      message,
    );
    emit(ChatLoaded(response)); 
    } catch (e) {
      emit(ChatError(e.toString()));
    }
    
  }

  
  
}
