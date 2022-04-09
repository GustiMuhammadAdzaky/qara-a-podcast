import 'package:flutter/material.dart';
import 'package:podcast/shared/theme.dart';

class ButtonCustom extends StatelessWidget {
  final String category;

  const ButtonCustom({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 116,
      height: 43,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2),
        onPressed: () {},
        child: Text(
          category,
          style: whiteTextStyle.copyWith(
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}
