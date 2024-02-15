import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/cubit/chat_cubit.dart';

class EmojiComponents extends StatelessWidget {
  const EmojiComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {},
      builder: (context, state) {
        ChatCubit cubit = ChatCubit.get(context);
        return (cubit.emoji)
            ? SizedBox(
                width: double.infinity,
                height: 400,
                child: EmojiPicker(
                  onEmojiSelected: (Category? category, Emoji? emoji) {
                    // Do something when emoji is tapped (optional)
                    cubit.startWrite();
                  },
                  onBackspacePressed: () {
                    // Do something when the user taps the backspace button (optional)
                    // Set it to null to hide the Backspace-Button
                  },
                  textEditingController: cubit.messageController,
                  // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
                  config: Config(
                    columns: 7,
                    emojiSizeMax: 32 *
                        (foundation.defaultTargetPlatform == TargetPlatform.iOS
                            ? 1.30
                            : 1.0),
                    // Issue: https://github.com/flutter/flutter/issues/28894
                    verticalSpacing: 0,
                    horizontalSpacing: 0,
                    gridPadding: EdgeInsets.zero,
                    initCategory: Category.RECENT,
                    bgColor: Color(0xFFF2F2F2),
                    indicatorColor: Colors.blue,
                    iconColor: Colors.grey,
                    iconColorSelected: Colors.blue,
                    backspaceColor: Colors.blue,
                    skinToneDialogBgColor: Colors.white,
                    skinToneIndicatorColor: Colors.grey,
                    enableSkinTones: true,
                    recentTabBehavior: RecentTabBehavior.RECENT,
                    recentsLimit: 28,
                    noRecents: const Text(
                      'No Recents',
                      style: TextStyle(fontSize: 20, color: Colors.black26),
                      textAlign: TextAlign.center,
                    ),
                    // Needs to be const Widget
                    loadingIndicator: const SizedBox.shrink(),
                    // Needs to be const Widget
                    tabIndicatorAnimDuration: kTabScrollDuration,
                    categoryIcons: const CategoryIcons(),
                    buttonMode: ButtonMode.MATERIAL,
                  ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
