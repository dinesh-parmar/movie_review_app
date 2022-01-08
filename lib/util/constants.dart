import 'package:flutter/material.dart';
import 'package:movie_review_app/gen/fonts.gen.dart';

class AppColors {
  AppColors._();

  static const backgroundColor = Color(0xff121212);
  static const secondaryBackgroundColor = Color(0xffa1c9c9);
  static const primarySwatch = Colors.black12;
}

class Genre {
  Genre._();
  static Map<String, String> genres = {
    "10759": "Action & Adventure",
    "16": "Animation",
    "35": "Comedy",
    "80": "Crime",
    "99": "Documentary",
    "18": "Drama",
    "12": "Adventure",
    "14": "Fantasy",
    "28": "Action",
    "27": "Horror",
    "10751": "Family",
    "10762": "Kids",
    "9648": "Mystery",
    "10763": "News",
    "10764": "Reality",
    "10765": "Sci-Fi & Fantasy",
    ":10766": "Soap",
    "10767": "Talk",
    "10768": "War & Politics",
    "37": "Western",
    "36": "History",
    "10402": "Music",
    "10749": "Romance",
    "878": "Science Fiction",
    "10770": "TV Movie",
    "53": "Thriller",
    "10752": "War",
  };

  static String? getGenre(String id) {
    return genres[id];
  }
}

Center get progressBar => const Center(child: CircularProgressIndicator(color: Colors.red));

class TextStyles {
  TextStyles._();
  static const title = TextStyle(fontFamily: FontFamily.poppinsBold);
}

const COLOR_PRIMARY = Colors.deepOrangeAccent;
const COLOR_ACCENT = Colors.orange;
const COLOR_BACKGROUND_DARK = Color(0xFF171822);
const COLOR_BACKGROUND = Colors.white;
const COLOR_BACKGROUND_LIGHT = Color(0xFFF1F3F6);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: COLOR_BACKGROUND,
  primaryColor: COLOR_PRIMARY,
  cardColor: const Color(0xffF1F3F6),
  iconTheme: const IconThemeData(
    color: Color(0xFF3A4276),
  ),
  textTheme: const TextTheme(
    button: TextStyle(
      fontSize: 15,
      height: 1.6,
      color: Color(0xff212330),
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.poppinsMedium,
    ),
    bodyText2: TextStyle(
      fontSize: 12,
      color: Color(0xff1B1D28),
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.poppinsRegular,
    ),
    bodyText1: TextStyle(
      height: 1.6,
      fontSize: 12,
      color: Color(0xff7b7f9e),
      fontWeight: FontWeight.w400,
      fontFamily: FontFamily.poppinsLight,
    ),
    headline2: TextStyle(
      fontSize: 24,
      color: Color(0xff171822),
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.poppinsBold,
    ),
    headline3: TextStyle(
      fontSize: 22,
      color: Color(0xff3A4276),
      fontWeight: FontWeight.w800,
      fontFamily: FontFamily.poppinsSemiBold,
    ),
    headline4: TextStyle(
      fontSize: 15,
      color: Color(0xff3A4276),
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.poppinsSemiBold,
    ),
    headline5: TextStyle(
      fontSize: 22,
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.poppinsSemiBold,
    ),
    headline6: TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.poppinsLight,
    ),
    subtitle1: TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontFamily: FontFamily.poppinsRegular,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: COLOR_BACKGROUND_LIGHT),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  backgroundColor: COLOR_BACKGROUND_DARK,
  iconTheme: const IconThemeData(
    color: Color(0xff7b7f9e),
  ),
  cardColor: const Color(0xFF212330),
  textTheme: const TextTheme(
    button: TextStyle(
      fontSize: 15,
      height: 1.6,
      color: Color(0xff212330),
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.poppinsMedium,
    ),
    bodyText2: TextStyle(
      fontSize: 12,
      color: Color(0xff1B1D28),
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.poppinsRegular,
    ),
    bodyText1: TextStyle(
      height: 1.6,
      fontSize: 12,
      color: Color(0xff7b7f9e),
      fontWeight: FontWeight.w400,
      fontFamily: FontFamily.poppinsLight,
    ),
    headline2: TextStyle(
      fontSize: 24,
      color: Color(0xff171822),
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.poppinsBold,
    ),
    headline3: TextStyle(
      fontSize: 22,
      color: Color(0xff3A4276),
      fontWeight: FontWeight.w800,
      fontFamily: FontFamily.poppinsSemiBold,
    ),
    headline4: TextStyle(
      fontSize: 15,
      color: Color(0xff3A4276),
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.poppinsSemiBold,
    ),
    headline5: TextStyle(
      fontSize: 22,
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.poppinsSemiBold,
    ),
    headline6: TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.poppinsLight,
    ),
    subtitle1: TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontFamily: FontFamily.poppinsRegular,
    ),
  ),
);
