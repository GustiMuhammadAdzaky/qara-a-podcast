import 'package:flutter/material.dart';
import 'package:podcast/shared/theme.dart';

class HeaderApp extends StatelessWidget {
  const HeaderApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 70),
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
}
