import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast/bloc/podcast_bloc.dart';
import 'package:podcast/models/podcast_model.dart';
import 'package:podcast/resources/api_provider.dart';

import 'package:podcast/shared/theme.dart';
import 'package:podcast/widgets/card_podcast.dart';
import 'package:podcast/widgets/header.dart';
import 'package:podcast/widgets/podcast_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PodcastBloc _newsBloc = PodcastBloc();
  final ApiProvider _refresh = ApiProvider();

  @override
  void initState() {
    _newsBloc.add(GetPodcastList());
    _refresh.fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
                expandedHeight: 240,
                floating: true,
                elevation: 0,
                pinned: true,
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
                flexibleSpace: const FlexibleSpaceBar(
                  centerTitle: true,
                  expandedTitleScale: 2,
                  background: HeaderApp(),
                  collapseMode: CollapseMode.parallax,
                ))
          ];
        },
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowIndicator();
            return true;
          },
          child: BlocProvider(
            create: (context) => _newsBloc,
            child: BlocListener<PodcastBloc, PodcastState>(
              listener: (context, state) {
                if (state is PodcastError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message!),
                    ),
                  );
                }
              },
              child: BlocBuilder<PodcastBloc, PodcastState>(
                builder: (context, state) {
                  if (state is PodcastInitial) {
                    return _buildLoading();
                  } else if (state is PodcasLoading) {
                    return _buildLoading();
                  } else if (state is PodcastSuccess) {
                    return RefreshIndicator(
                      onRefresh: () => _refresh.fetchdata(),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            terbaruText(),
                            buildCard(context, state.podcastModel),
                            semuaEpisodeText(),
                            buildTile(context, state.podcastModel)
                          ],
                        ),
                      ),
                    );
                  } else if (state is PodcastError) {}

                  return Center(
                    child: _buildLoading(),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, List<PodcastModel> model) {
    return SizedBox(
      height: 230,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: model.length,
        itemBuilder: (BuildContext context, int index) {
          return PodcastCard(model[index]);
        },
      ),
    );
  }
}

Widget terbaruText() {
  return Container(
    margin: const EdgeInsets.only(left: 20, bottom: 12, top: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Terbaru',
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
        )
      ],
    ),
  );
}

Widget _buildLoading() => const Center(child: CircularProgressIndicator());

Widget semuaEpisodeText() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 12),
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
  );
}

Widget buildTile(BuildContext context, List<PodcastModel> podcast) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: podcast.length,
      itemBuilder: (BuildContext context, int index) {
        return PodcastTile(podcast[index]);
      },
    ),
  );
}
