import 'package:dreamlendar/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kContentColorLight54Theme.withOpacity(0.1),
    appBarTheme: appBarTheme,
    iconTheme: IconThemeData(color: kWhiteColor),
    textTheme: GoogleFonts.federoTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: kWhiteColor, displayColor: kBlackColor),
    colorScheme: ColorScheme.light(
      primary: kPrimaryColor,
      error: kErrorColor,
      onSurface: Colors.black,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: kContentColorLight54Theme.withOpacity(0.7),
      unselectedItemColor: kContentColorLight54Theme.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: kPrimaryColor),
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kContentColorLight54Theme.withOpacity(0.1),
    appBarTheme: appBarTheme,
    iconTheme: IconThemeData(color: kBlackColor),
    textTheme: GoogleFonts.federoTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: kBlackColor, displayColor: kWhiteColor),
    colorScheme: ColorScheme.dark().copyWith(
      primary: kPrimaryColor,
      error: kErrorColor,
      onSurface: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kContentColorLight54Theme,
      selectedItemColor: Colors.white70,
      unselectedItemColor: kContentColorDark54Theme.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: kPrimaryColor),
    ),
  );
}

final appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);
