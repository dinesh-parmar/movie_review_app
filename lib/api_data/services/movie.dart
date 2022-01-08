import 'package:movie_review_app/api_data/api/movieapi.dart';
import 'package:movie_review_app/model/response/in_theater_movies.dart';
import 'package:movie_review_app/model/response/popular_movies.dart';
import 'package:movie_review_app/util/general_response.dart';

import '../base_api.dart';

class MovieService with BaseApi {
  late final Movieapi _movieApi;

  MovieService() : _movieApi = Movieapi();

  Future<GeneralResponse<PopularMovies>> getPopularMovies(int pageNo) => loadResponse(() => _movieApi.getPopularMovies(pageNo));

  Future<GeneralResponse<InTheaterMovies>> getInTheaterMovies(int pageNo) => loadResponse(() => _movieApi.getInTheaterMovies(pageNo));
}
