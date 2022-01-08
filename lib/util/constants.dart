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
