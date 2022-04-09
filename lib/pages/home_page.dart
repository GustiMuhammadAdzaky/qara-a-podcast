import 'package:flutter/material.dart';
import 'package:podcast/shared/theme.dart';
import 'package:podcast/widgets/button_custom.dart';
import 'package:podcast/widgets/card_podcast.dart';
import 'package:podcast/widgets/podcast_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
                expandedHeight: 200,
                floating: true,
                elevation: 0,
                forceElevated: true,
                stretch: true,
                title: const Text(
                  "Qara'a",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
                centerTitle: true,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                backgroundColor: Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  expandedTitleScale: 1.5,
                  background: infoApp(),
                  collapseMode: CollapseMode.parallax,
                ))
          ];
        },
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, bottom: 12, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Terbaru',
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      )
                    ],
                  ),
                ),

                podcastNew(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  margin: const EdgeInsets.only(top: 24, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Semua episode',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
                // categoryList(),
                podcastTile()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget infoApp() {
    return Container(
      padding: const EdgeInsets.only(top: 55),
      decoration: const BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(
          'assets/gradient.png',
        ),
      )),
      margin: const EdgeInsets.only(top: 20),
      child: Center(
        child: Column(
          children: [
            Container(
              width: 75,
              height: 75,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Logo.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Kumpulan dakwah islami yang siap menemani hari mu. Update setiap 2 kali sepekan. Stay Tune!',
                style: blackTextStyle.copyWith(fontSize: 13),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget podcastNew() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: const EdgeInsets.only(left: 18, right: 18),
        child: Row(
          children: const [
            CardPodcast(),
          ],
        ),
      ),
    );
  }

  Widget categoryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          ButtonCustom(category: 'kajian islam'),
          ButtonCustom(category: 'ramadan series'),
          ButtonCustom(category: 'kajian islam'),
          ButtonCustom(category: 'kajian islam')
        ],
      ),
    );
  }

  Widget podcastTile() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: const [
          PodcastTile(
            title: 'sada',
            category: 'asdasd',
            imagePath: 'assets/img1.png',
            date: '20 mei',
          ),
          PodcastTile(
            title: 'sada',
            category: 'asdasd',
            imagePath: 'assets/img1.png',
            date: '20 mei',
          ),
          PodcastTile(
            title: 'sada',
            category: 'asdasd',
            imagePath: 'assets/img1.png',
            date: '20 mei',
          ),
          PodcastTile(
            title: 'sada',
            category: 'asdasd',
            imagePath: 'assets/img1.png',
            date: '20 mei',
          ),
          PodcastTile(
            title: 'sada',
            category: 'asdasd',
            imagePath: 'assets/img1.png',
            date: '20 mei',
          ),
        ],
      ),
    );
  }
}
