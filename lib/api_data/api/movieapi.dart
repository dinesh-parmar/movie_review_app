import 'package:movie_review_app/model/response/in_theater_movies.dart';
import 'package:movie_review_app/model/response/popular_movies.dart';
import 'package:movie_review_app/util/helpers.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'movieapi.g.dart';

@RestApi()
abstract class Movieapi {
  factory Movieapi({String? baseUrl}) => _Movieapi(buildDio(), baseUrl: serviceApi('movie'));

  @GET('/popular')
  Future<PopularMovies> getPopularMovies(@Query('page') int pageNo);

  @GET("/now_playing")
  Future<InTheaterMovies> getInTheaterMovies(@Query('page') int pageNo);
}
