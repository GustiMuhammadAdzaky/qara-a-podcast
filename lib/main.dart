import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:podcast/pages/detail_podcast_page.dart';
import 'package:podcast/pages/home_page.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        '/detail-podcast': (context) => const DetailPodcast(),
      },
    );
  }
}
