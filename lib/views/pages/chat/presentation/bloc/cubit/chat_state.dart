part of 'chat_cubit.dart';

sealed class ChatCubitState extends Equatable {
  const ChatCubitState();

  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatCubitState {}
final class ChatLoading extends ChatCubitState {}
final class ChatLoaded extends ChatCubitState {
  final String data;
  const ChatLoaded(this.data);
  @override
  List<Object> get props => [data];
}
final class ChatError extends ChatCubitState {
  final String message;
  const ChatError(this.message);
  @override
  List<Object> get props => [message];
}

