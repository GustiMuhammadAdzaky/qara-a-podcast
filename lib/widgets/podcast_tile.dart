import 'package:flutter/material.dart';
import 'package:podcast/shared/theme.dart';

class PodcastTile extends StatelessWidget {
  final String title;
  final String imagePath;
  final String category;
  final String date;

  const PodcastTile(
      {Key? key,
      required this.title,
      required this.imagePath,
      required this.category,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail-podcast');
      },
      child: Container(
        height: 90,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 12, right: 20, bottom: 6),
        padding: const EdgeInsets.only(left: 6, top: 8, bottom: 8),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300, width: 2),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    imagePath,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    category,
                    style: greyTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: light,
                    ),
                  ),
                  Text(
                    date,
                    style:
                        greyTextStyle.copyWith(fontSize: 8, fontWeight: light),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
