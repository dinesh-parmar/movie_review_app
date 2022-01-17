import 'package:movie_review_app/api_data/api/movieapi.dart';
import 'package:movie_review_app/model/response/full_movie_detail.dart';
import 'package:movie_review_app/model/response/movies_response.dart';
import 'package:movie_review_app/util/general_response.dart';

import '../base_api.dart';

class MovieService with BaseApi {
  late final Movieapi _movieApi;

  MovieService() : _movieApi = Movieapi();

  Future<GeneralResponse<MoviesResp>> getMoviesForService(int pageNo, ServiceName serviceName) =>
      loadResponse(() => _movieApi.getMoviesForService(serviceName.name, pageNo));

  Future<GeneralResponse<FullMovieDetail>> getMovieDetails(int movieId) => loadResponse(() => _movieApi.getMovieDetails(movieId));
}
