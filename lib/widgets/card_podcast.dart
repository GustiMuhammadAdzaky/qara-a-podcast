import 'package:flutter/material.dart';
import 'package:podcast/models/podcast_model.dart';
import 'package:podcast/pages/detail_podcast_page.dart';
import 'package:podcast/shared/theme.dart';

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
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPodcast(widget._podcastModel)));
      },
      child: Container(
        height: 200,
        width: 150,
        margin: const EdgeInsets.only(right: 12),
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
              height: 2,
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
}
