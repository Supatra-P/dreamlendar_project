import 'package:dreamlendar/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// This is our main focus
// Let's apply light and dark theme on our app
// Now let's add dark theme on our app

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kContentColorLight54Theme.withOpacity(0.1),
    appBarTheme: appBarTheme,
    iconTheme: IconThemeData(color: kContentColorDark54Theme),
    textTheme: GoogleFonts.federoTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: kWhiteColor),
    colorScheme: ColorScheme.light(
      primary: kPrimaryColor,
      // secondary: kSecondaryColor,
      error: kErrorColor,
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
  // Bydefault flutter provide us light and dark theme
  // we just modify it as our need
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kContentColorLight54Theme.withOpacity(0.1),
    appBarTheme: appBarTheme,
    iconTheme: IconThemeData(color: kContentColorLight54Theme),
    textTheme: GoogleFonts.federoTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: kBlackColor),
    colorScheme: ColorScheme.dark().copyWith(
      primary: kPrimaryColor,
      // secondary: kSecondaryColor,
      error: kErrorColor,
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
