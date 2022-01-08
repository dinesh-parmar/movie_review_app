import 'package:flutter/material.dart';
import 'package:movie_review_app/gen/fonts.gen.dart';
import 'package:movie_review_app/model/response/movie_detail.dart';
import 'package:movie_review_app/util/constants.dart';
import 'package:movie_review_app/util/extensions.dart';
import 'package:movie_review_app/widget/platform_cached_network_image.dart';

class MovieCard extends StatelessWidget {
  final MovieDetail movieDetail;

  const MovieCard({Key? key, required this.movieDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.only(left: 180),
          height: 150,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            color: const Color(0xff1B1C20),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                movieDetail.originalTitle!,
                style: TextStyles.title.copyWith(color: Colors.white70, fontSize: 18),
              ),
              const SizedBox(height: 5),
              Wrap(
                children: movieDetail.genreIds!
                    .map(
                      (e) => Text(
                        (Genre.getGenre(e.toString()) ?? "") + " ",
                        style: const TextStyle(fontSize: 15, fontFamily: FontFamily.poppinsRegular, color: Colors.grey),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 5),
              Text(
                "⭐  ${movieDetail.voteAverage!}  |  ${movieDetail.releaseDate}",
                style: const TextStyle(fontSize: 15, fontFamily: FontFamily.poppinsSemiBold, color: Colors.grey),
              )
            ],
          ),
        ),
        Positioned(
          left: 30,
          bottom: 60,
          top: 0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.purple),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: PlatformCachedNetworkImage(
                movieDetail.posterPath!.getImageLink(300),
                fit: BoxFit.cover,
                width: 150,
                alignment: Alignment.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
