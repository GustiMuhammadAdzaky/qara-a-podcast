import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:podcast/models/podcast_model.dart';
import 'package:podcast/shared/theme.dart';
import 'package:podcast/widgets/mini_player.dart';

class PodcastCard extends StatefulWidget {
  final PodcastModel _podcastModel;

  const PodcastCard(
    this._podcastModel, {
    Key? key,
  }) : super(key: key);

  @override
  State<PodcastCard> createState() => _PodcastCardState();
}

class _PodcastCardState extends State<PodcastCard> {
  AudioPlayer audioPlayer = AudioPlayer();

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
    return GestureDetector(
      onTap: () {
        _Miniplayer(context, widget._podcastModel);
      },
      child: Container(
        height: 200,
        width: 150,
        margin: const EdgeInsets.only(
          left: 20,
        ),
        child: Column(
          children: [
            Container(
              height: 153,
              width: 153,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(widget._podcastModel.imageUrl),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Text(
                    widget._podcastModel.title,
                    style: blackTextStyle.copyWith(
                        fontWeight: semiBold, fontSize: 12),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    widget._podcastModel.category,
                    style:
                        greyTextStyle.copyWith(fontSize: 12, fontWeight: light),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _Miniplayer(context, PodcastModel podcastModel) {
    showBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return GlassmorphicContainer(
            constraints: const BoxConstraints(maxHeight: double.infinity),
            height: 110,
            width: double.infinity,
            borderRadius: 10,
            blur: 4,
            alignment: Alignment.bottomCenter,
            border: 1,
            linearGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color.fromARGB(31, 154, 170, 255).withOpacity(0.10),
                  const Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
                ],
                stops: const [
                  0.1,
                  1,
                ]),
            borderGradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.topRight,
              colors: [
                const Color(0xFFffffff).withOpacity(0.10),
                const Color((0xFFFFFFFF)).withOpacity(0.0),
              ],
            ),
            child: MiniPlayer(podcastModel),
          );
        });
  }
}
