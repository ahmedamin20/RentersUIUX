import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:ksb/views/pages/chat/presentation/bloc/cubit/chat_cubit.dart';

// For the testing purposes, you should probably use https://pub.dev/packages/uuid.
String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');
  final _user2 = const types.User(id: 'chatGPT');

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => ChatCubit(),
        child: Scaffold(
          body: BlocConsumer<ChatCubit, ChatCubitState>(
            listener: (context, state) {
             if(state is ChatLoaded)
             {
               
                types.Message message = types.TextMessage( author: _user2, createdAt: DateTime.now().millisecondsSinceEpoch, id: randomString(), text: state.data.replaceAll('{', '').replaceAll('text', '').replaceAll("}", '').replaceAll(':', ''));
               
               _addMessage(message);
            }
            },
            builder: (context, state) {

              return Chat(
                messages: _messages,
                onSendPressed: (types.PartialText message) {
                  _handleSendPressed(message, context.read<ChatCubit>());
                },
                
                user: _user,
              );
            },
          ),
        ),
      );

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message  , ChatCubit chatCubit) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );
    chatCubit.sendChat(textMessage.text);
    _addMessage(textMessage);
  }
}
