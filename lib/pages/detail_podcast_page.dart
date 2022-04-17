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
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(widget.podcastModel.imageUrl),
                    fit: BoxFit.cover,
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
                  const SizedBox(height: 41),
                  ClipOval(
                    child: Material(
                      color: Colors.purple[400], // Button color
                      child: InkWell(
                        splashColor: Colors.red, // Splash color
                        onTap: () {
                          getAudio(widget.podcastModel.voiceUrl);
                        },
                        child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Icon(
                              playBtn,
                              color: Colors.white,
                              size: 40,
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Slider.adaptive(
                      min: 0.0,
                      thumbColor: Colors.purple[400],
                      activeColor: Colors.purple[400],
                      value: position.inSeconds.toDouble(),
                      max: duration.inSeconds.toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          audioPlayer.seek(Duration(seconds: value.toInt()));
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            position != null
                                ? "${positionText ?? ''}"
                                : duration != null
                                    ? durationText
                                    : '',
                            // ignore: conflicting_dart_import
                            style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
