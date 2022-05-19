import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:podcast/models/podcast_model.dart';
import 'package:podcast/shared/theme.dart';

class MiniPlayer extends StatefulWidget {
  final PodcastModel podcastModel;
  const MiniPlayer(this.podcastModel, {Key? key}) : super(key: key);

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  AudioPlayer audioPlayer = AudioPlayer();

  IconData playBtn = Icons.play_arrow;
  bool playing = false;
  Duration duration = const Duration();
  Duration position = const Duration();

  get durationText =>
      duration != null ? duration.toString().split('.').first : '';
  get positionText =>
      position != null ? position.toString().split('.').first : '';

  void getAudio(String url) async {
    if (playing) {
      var res = await audioPlayer.pause();
      if (res == 1) {
        setState(() {
          playBtn = playBtn = Icons.play_arrow;
          playing = false;
        });
      }
    } else {
      var res = await audioPlayer.play(url);
      if (res == 1) {
        setState(() {
          playBtn = Icons.pause;
          playing = true;
        });
      }
    }
    audioPlayer.onDurationChanged.listen((Duration dd) {
      setState(() {
        duration = dd;
      });
      audioPlayer.onAudioPositionChanged.listen((Duration dd) {
        setState(() {
          position = dd;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 26),
      color: Colors.transparent,
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.podcastModel.imageUrl),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.podcastModel.title,
                      style: blackTextStyle.copyWith(fontWeight: bold),
                    ),
                    Text(
                      widget.podcastModel.category,
                      style: blackTextStyle.copyWith(fontSize: 10),
                    ),
                    Text(
                        position != null
                            ? "${positionText ?? ''}"
                            : duration != null
                                ? durationText
                                : '',
                        // ignore: conflicting_dart_import
                        style: const TextStyle(fontSize: 6)),
                  ],
                ),
              ),
            ),
            Center(
              child: IconButton(
                color: Colors.white,
                onPressed: () {
                  getAudio(widget.podcastModel.voiceUrl);
                },
                icon: Icon(playBtn),
                iconSize: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}
