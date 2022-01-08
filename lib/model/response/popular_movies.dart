import 'package:json_annotation/json_annotation.dart';
import 'package:movie_review_app/model/response/movie_detail.dart';

part 'popular_movies.g.dart';

@JsonSerializable()
class PopularMovies {
  int? page;
  List<MovieDetail>? results;
  @JsonKey(name: 'total_results')
  int? totalResults;
  @JsonKey(name: 'totalPages')
  int? totalPages;

  PopularMovies({this.page, this.results, this.totalResults, this.totalPages});

  factory PopularMovies.fromJson(Map<String, dynamic> json) => _$PopularMoviesFromJson(json);

  Map<String, dynamic> toJson() => _$PopularMoviesToJson(this);
}
