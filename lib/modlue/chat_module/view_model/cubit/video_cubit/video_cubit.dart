import 'dart:io' as io;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:video_player/video_player.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoInitial());

  static VideoCubit get(context) => BlocProvider.of(context);
  late VideoPlayerController controller;

  Future<void> initializeVideoPlayer(String videoUrl) async {
    if (videoUrl.contains('http')) {
      controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
        ..initialize().then((_) {});
    } else {
      controller = VideoPlayerController.file(io.File(videoUrl))
        ..initialize().then((_) {});
    }
    emit(VideoLoadedState());
  }
}
