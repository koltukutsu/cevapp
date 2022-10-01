import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:equatable/equatable.dart";

part "audio_player_state.dart";

class AudioPlayerCubit extends Cubit<AudioPlayerState> {
  final AudioPlayer audioPlayer;
  var isPlaying;
  var duration;
  var position;

  AudioPlayerCubit({required this.audioPlayer}) : super(IdleState());

  Future<void> setAudioAndPlay({required String path}) async {
    if (isPlaying == PlayerState.playing ) {
      audioPlayer.stop();
      // audioPlayer.dispose();
    }
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    audioPlayer.setSourceDeviceFile(path);

    audioPlayer.onPlayerStateChanged.listen((state) {
        isPlaying = state == PlayerState.playing;
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
        duration = newDuration;
    });

    audioPlayer.onDurationChanged.listen((newPosition) {
        position = newPosition;
    });
  }


}
