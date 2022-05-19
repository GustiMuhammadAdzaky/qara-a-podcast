import 'package:flutter/material.dart';
import 'package:podcast/models/podcast_model.dart';
import 'package:podcast/pages/detail_podcast_page.dart';
import 'package:intl/intl.dart';
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
          child: Expanded(
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
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _podcastModel.title,
                            style: blackTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: semiBold,
                                overflow: TextOverflow.clip),
                          ),
                          Text(
                            _podcastModel.category,
                            style: greyTextStyle.copyWith(
                              fontSize: 10,
                              fontWeight: light,
                            ),
                          ),
                          Text(
                            DateFormat.yMMMEd().format(
                              DateTime.parse(_podcastModel.createdAt),
                            ),
                            style: greyTextStyle.copyWith(
                                fontSize: 8, fontWeight: light),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
