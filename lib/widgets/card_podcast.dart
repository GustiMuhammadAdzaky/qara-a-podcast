import 'package:flutter/material.dart';
import 'package:podcast/api/api.dart';
import 'package:podcast/models/podcast.dart';
import 'package:podcast/shared/theme.dart';

class CardPodcast extends StatefulWidget {
  const CardPodcast({Key? key}) : super(key: key);

  @override
  State<CardPodcast> createState() => _CardPodcastState();
}

class _CardPodcastState extends State<CardPodcast> {
  late Future<List<Album>> futureData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureData = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Album>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Album>? data = snapshot.data;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data?.length,
              itemBuilder: (BuildContext context, int index) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Card(
                          child: Image.asset(''),
                          elevation: 0,
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
                              data![index].title,
                              style: blackTextStyle.copyWith(
                                  fontWeight: semiBold, fontSize: 12),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.clip,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              data[index].title,
                              style: greyTextStyle.copyWith(
                                  fontSize: 12, fontWeight: light),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        });
  }
}
