import 'package:json_annotation/json_annotation.dart';
import 'package:movie_review_app/model/response/movie_detail.dart';

part 'in_theater_movies.g.dart';

@JsonSerializable()
class InTheaterMovies {
  int? page;
  List<MovieDetail>? results;
  Dates? dates;
  @JsonKey(name: "total_pages")
  int? totalPages;
  @JsonKey(name: "total_results")
  int? totalResults;

  InTheaterMovies({this.page, this.results, this.dates, this.totalPages, this.totalResults});

  factory InTheaterMovies.fromJson(Map<String, dynamic> json) => _$InTheaterMoviesFromJson(json);

  Map<String, dynamic> toJson() => _$InTheaterMoviesToJson(this);
}

@JsonSerializable()
class Dates {
  String? maximum;
  String? minimum;

  Dates({this.maximum, this.minimum});

  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);

  Map<String, dynamic> toJson() => _$DatesToJson(this);
}
