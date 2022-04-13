import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:podcast/models/podcast_model.dart';
import 'package:podcast/shared/theme.dart';

class DetailPodcast extends StatefulWidget {
  final PodcastModel podcastModel;
  const DetailPodcast(this.podcastModel, {Key? key}) : super(key: key);

  @override
  State<DetailPodcast> createState() => _DetailPodcastState();
}

class _DetailPodcastState extends State<DetailPodcast> {
  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  IconData playBtn = Icons.play_arrow;
  bool playing = false;
  Duration duration = const Duration();
  Duration position = const Duration();

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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 335,
                width: 335,
                margin: const EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.podcastModel.imageUrl),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    widget.podcastModel.title,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.podcastModel.category,
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                  Slider.adaptive(
                    min: 0.0,
                    value: position.inSeconds.toDouble(),
                    max: duration.inSeconds.toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        audioPlayer.seek(Duration(seconds: value.toInt()));
                      });
                    },
                  ),
                  IconButton(
                      onPressed: () {
                        getAudio(widget.podcastModel.voiceUrl);
                      },
                      icon: Icon(playBtn))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
