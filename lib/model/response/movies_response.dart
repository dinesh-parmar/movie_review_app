import 'package:json_annotation/json_annotation.dart';
import 'package:movie_review_app/model/response/movie_detail.dart';
part 'movies_response.g.dart';

@JsonSerializable()
class MoviesResp {
  int? page;
  List<MovieDetail>? results;
  Dates? dates;
  @JsonKey(name: 'total_results')
  int? totalResults;
  @JsonKey(name: 'totalPages')
  int? totalPages;

  MoviesResp({this.page, this.results, this.totalResults, this.totalPages});

  factory MoviesResp.fromJson(Map<String, dynamic> json) => _$MoviesRespFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesRespToJson(this);
}

@JsonSerializable()
class Dates {
  String? maximum;
  String? minimum;

  DateTime get maximumDate => DateTime.parse(maximum ?? "");
  DateTime get minimumDate => DateTime.parse(minimum ?? "");

  Dates({this.maximum, this.minimum});

  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);

  Map<String, dynamic> toJson() => _$DatesToJson(this);
}
