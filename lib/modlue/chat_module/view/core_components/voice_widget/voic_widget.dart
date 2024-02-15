import 'package:audioplayers/audioplayers.dart';
import 'package:chat_bubbles/bubbles/bubble_normal_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/constants.dart';
import '../../../view_model/cubit/chat_cubit.dart';

class AudioChatBuble extends StatefulWidget {
  final String audio;
  final bool sender;
  bool isPlaying;
  bool isLoading;
  bool isPause;

  AudioChatBuble({
    super.key,
    required this.audio,
    required this.sender,
    this.isPlaying = false,
    this.isLoading = false,
    this.isPause = false,
  });

  @override
  State<AudioChatBuble> createState() => _AudioChatBubleState();
}

class _AudioChatBubleState extends State<AudioChatBuble> {
  final AudioPlayer player = AudioPlayer();
  Duration position = const Duration();

  double currentTime = 0.0;
  double maxDuration = 0.0;

  @override
  void initState() {
    super.initState();
    player.onDurationChanged.listen((event) {
      setState(() {
        maxDuration = event.inSeconds.toDouble();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        ChatCubit cubit = ChatCubit.get(context);
        return BubbleNormalAudio(
          color: widget.sender ? primaryColor! : Colors.white,

          textStyle: const TextStyle(color: Colors.white),

          position: position.inSeconds.toDouble(),
          duration: maxDuration,
          isPlaying: widget.isPlaying,
          isLoading: widget.isLoading,
          isPause: widget.isPause,
          onSeekChanged: (value) async {
            currentTime = value;
            position = Duration(seconds: value.toInt());
            await player.seek(position);
            setState(() {});
          },
          //_changeSeek
          onPlayPauseButtonClick: () async {
            // cubit.changeAudioState();

            if (!widget.isPlaying) {
              // cubit.changeAudioState();

              setState(() {
                widget.isPlaying = true;
                widget.isPause = false;
              });
              // if (player.state == PlayerState.playing)
              // {
              //   // ChatCubit.get(context).audioPlayers.forEach((value)
              //   // {
              //   //   value.pause();
              //   //   setState(() {
              //   //     isPlaying = false;
              //   //     isPause = true;
              //   //   });
              //   // });
              //   print('pause all');
              // }
              if (widget.audio.contains('http') ||
                  widget.audio.contains('https')) {
                ChatCubit.get(context).audioPlayers.add(AudiPlayerModel(
                      audioPlayer: player,
                      widget: widget,
                    ));
                await player.play(UrlSource(widget.audio));
              } else {
                ChatCubit.get(context).audioPlayers.add(AudiPlayerModel(
                      audioPlayer: player,
                      widget: widget,
                    ));
                await player.play(DeviceFileSource(widget.audio));
              }
              await player.resume();
              player.onPositionChanged.listen((event) {
                position = event;
                currentTime = position.inSeconds.toDouble();
                setState(() {});
              });
              player.onPlayerComplete.listen((event) {
                position = const Duration(seconds: 0);
                widget.isPlaying = false;
                widget.isPause = false;
                setState(() {});
              });
            } else {
              setState(() {
                widget.isPause = true;
                widget.isPlaying = false;
              });
              await player.pause();
            }
            // setState(() {});
          },
          isSender: widget.sender,
        );
      },
    );
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}
