import 'package:audioplayers/audioplayers.dart';

class AudioPlayerHelper {
  AudioPlayerHelper._();

  static AudioPlayerHelper audioPlayerHelper = AudioPlayerHelper._();

  AudioPlayer _audioPlayer = AudioPlayer();

  AudioPlayer get audioPlayer => _audioPlayer;

  Future<void> play(String path) async {
    if (_audioPlayer!.state == PlayerState.playing) {
      _audioPlayer.stop();
    }
    if (path.contains('http') || path.contains('https')) {
      await _audioPlayer.play(UrlSource(path));
    } else {
      await _audioPlayer.play(DeviceFileSource(path));
    }
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
  }
}
