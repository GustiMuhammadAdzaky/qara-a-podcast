import 'package:flutter/material.dart';
import 'package:podcast/models/podcast_model.dart';
import 'package:podcast/pages/detail_podcast_page.dart';

import '../shared/theme.dart';

class PodcastTile extends StatelessWidget {
  final PodcastModel _podcastModel;

  const PodcastTile(
    this._podcastModel, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPodcast(_podcastModel)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 2),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Container(
                height: 62,
                width: 62,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(_podcastModel.imageUrl),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2),
                margin: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _podcastModel.title,
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      _podcastModel.category,
                      style: greyTextStyle.copyWith(
                        fontSize: 10,
                        fontWeight: light,
                      ),
                    ),
                    Text(
                      _podcastModel.createdAt,
                      style: greyTextStyle.copyWith(
                          fontSize: 8, fontWeight: light),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
