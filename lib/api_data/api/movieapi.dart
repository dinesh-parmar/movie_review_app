// ignore_for_file: constant_identifier_names

import 'package:movie_review_app/model/response/full_movie_detail.dart';
import 'package:movie_review_app/model/response/movies_response.dart';
import 'package:movie_review_app/util/helpers.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'movieapi.g.dart';

@RestApi()
abstract class Movieapi {
  factory Movieapi({String? baseUrl}) => _Movieapi(buildDio(), baseUrl: serviceApi('movie'));

  @GET('/{serviceName}')
  Future<MoviesResp> getMoviesForService(@Path('serviceName') String serviceName, @Query('page') int pageNo);

  @GET('/{movieId}')
  Future<FullMovieDetail> getMovieDetails(@Path('movieId') int movieId);
}

enum ServiceName { popular, now_playing, upcoming, top_rated }
