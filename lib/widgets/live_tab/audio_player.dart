import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyAudioPlayer extends StatefulWidget {
  const MyAudioPlayer({Key? key}) : super(key: key);

  @override
  _MyAudioPlayerState createState() => _MyAudioPlayerState();
}

class _MyAudioPlayerState extends State<MyAudioPlayer> {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();


  @override
  void initState() {
    super.initState();
    setupPlaylist();

  }

  void setupPlaylist() async {
    audioPlayer.open(
      Playlist(
        audios: [
          Audio(
            "assets/audios/ig_audio.mp3",
          ),
        ],
      ),
      autoStart: false,
      playInBackground: PlayInBackground.enabled,
      showNotification: true,
      notificationSettings: const NotificationSettings(
        nextEnabled: false,
        prevEnabled: false,
        playPauseEnabled: true,
        seekBarEnabled: true,
        stopEnabled: true,
      ),
    );
  }

  Widget playBar(RealtimePlayingInfos realtimePlayingInfos) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(FontAwesomeIcons.backward),
          onPressed: () => audioPlayer.seekBy(
            const Duration(
              seconds: -10,
            ),
          ),
          iconSize: 40,
          color: Color(0xff242a54),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        IconButton(
          icon: Icon(realtimePlayingInfos.isPlaying
              ? Icons.pause_circle_filled_rounded
              : Icons.play_circle_fill_rounded),
          onPressed: () {
            audioPlayer.playOrPause();

          },
          iconSize: 80,
          color: Color(0xff242a54),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        IconButton(
          icon: const Icon(FontAwesomeIcons.forward),
          onPressed: () => audioPlayer.seekBy(const Duration(seconds: 10)),
          iconSize: 40,
          color: Color(0xff242a54),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
      ],
    );
  }

  /// Transforms string into a mm:ss format
  String transformString(int seconds) {
    String minuteString =
        '${(seconds / 60).floor() < 10 ? 0 : ''}${(seconds / 60).floor()}';
    String secondString = '${seconds % 60 < 10 ? 0 : ''}${seconds % 60}';
    return '$minuteString:$secondString'; // Returns a string with the format mm:ss
  }

  Widget timestamps(RealtimePlayingInfos realtimePlayingInfos) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          transformString(realtimePlayingInfos.currentPosition.inSeconds),
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(width: 220),
        Text(
          transformString(realtimePlayingInfos.duration.inSeconds),
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget slider(RealtimePlayingInfos realtimePlayingInfos) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            height: 20,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff1c1c1e),
                  Color(0xff1c1c1e),
                ],
                stops: [0.0, 0.55, 0.55, 1.0],
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
              ),
            ),
          ),
        ),
        SliderTheme(
          data: SliderThemeData(
            trackShape: CustomTrackShape(),
            trackHeight: 5,
            thumbColor: Colors.white,
            thumbShape: SliderComponentShape.noThumb,
            activeTrackColor: Colors.orangeAccent[400],
            inactiveTrackColor: Colors.grey[800],
            overlayColor: Colors.transparent,
          ),
          child: Slider.adaptive(
            value: realtimePlayingInfos.currentPosition.inSeconds.toDouble(),
            max: realtimePlayingInfos.duration.inSeconds.toDouble() + 20.0,
            min: -0.0001,
            onChanged: (value) {
              if (value <= 0) {
                audioPlayer.seek(
                  const Duration(seconds: 0),
                );
              } else if (value >= realtimePlayingInfos.duration.inSeconds) {
                audioPlayer.seek(realtimePlayingInfos.duration);
              } else {
                audioPlayer.seek(
                  Duration(
                    seconds: value.toInt(),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: audioPlayer.builderRealtimePlayingInfos(
        builder: (context, realtimePlayingInfos) {
          if (realtimePlayingInfos != null) {
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: slider(realtimePlayingInfos),
                  ),
                  timestamps(realtimePlayingInfos),
                  const SizedBox(height: 0),
                  playBar(realtimePlayingInfos),
                  // Lottie.network(
                  //   "https://assets5.lottiefiles.com/packages/lf20_6jfc4gby.json",
                  //   // height: 95,
                  //   // width: 50,
                  // ),
                ],
              ),
            );
          } else {
            return Column();
          }
        },
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  /// Removes side padding of slider
  /// Credit goes to @clocksmith, https://github.com/flutter/flutter/issues/37057
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double? trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
