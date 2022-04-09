import 'package:flutter/material.dart';

class DetailPodcast extends StatelessWidget {
  const DetailPodcast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.cover,
              )),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  backNavigationBack(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget backNavigationBack() {
    return Container(
      height: 335,
      width: 335,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/img4.png'),
        ),
      ),
    );
  }
}
