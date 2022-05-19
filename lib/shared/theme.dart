import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 20;

Color primaryColor = Colors.purple;
Color secondaryColor = const Color(0x00f08a5d);
Color kBlackColor = const Color.fromARGB(255, 0, 0, 0);
Color kWhiteColor = const Color(0xffFFFFFF);
Color kGreyColor = const Color(0xff9698A9);

Color darkGreyClr = const Color(0xff121212);
Color darkHeaderClr = Colors.grey.shade800;

TextStyle blackTextStyle = GoogleFonts.nunito(
  color: kBlackColor,
);

TextStyle whiteTextStyle = GoogleFonts.nunito(
  color: kWhiteColor,
);

TextStyle greyTextStyle = GoogleFonts.nunito(
  color: kGreyColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

class Themes {
  static final light = ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    brightness: Brightness.dark,
  );
}
