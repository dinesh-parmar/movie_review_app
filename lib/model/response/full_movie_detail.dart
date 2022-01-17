import 'package:json_annotation/json_annotation.dart';

part 'full_movie_detail.g.dart';

@JsonSerializable()
class FullMovieDetail {
  bool? adult;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'belongs_to_collection')
  dynamic belongsToCollection;
  int? budget;
  List<GenreModel>? genres;
  String? homepage;
  int? id;
  @JsonKey(name: 'imdb_id')
  String? imdbId;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  @JsonKey(name: 'production_companies')
  List<ProductionCompanies>? productionCompanies;
  @JsonKey(name: 'production_countries')
  List<ProductionCountries>? productionCountries;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  int? revenue;
  int? runtime;
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;

  FullMovieDetail(
      {this.adult,
      this.backdropPath,
      this.belongsToCollection,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  factory FullMovieDetail.fromJson(Map<String, dynamic> json) => _$FullMovieDetailFromJson(json);

  Map<String, dynamic> toJson() => _$FullMovieDetailToJson(this);
}

@JsonSerializable()
class SpokenLanguages {
  String? iso_639_1;
  String? name;

  SpokenLanguages({this.iso_639_1, this.name});

  factory SpokenLanguages.fromJson(Map<String, dynamic> json) => _$SpokenLanguagesFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguagesToJson(this);
  @override
  String toString() => toJson().toString();
}

@JsonSerializable()
class ProductionCountries {
  String iso_3166_1;
  String name;

  ProductionCountries({this.iso_3166_1 = '', this.name = ''});

  factory ProductionCountries.fromJson(Map<String, dynamic> json) => _$ProductionCountriesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountriesToJson(this);
  @override
  String toString() => toJson().toString();
}

@JsonSerializable()
class ProductionCompanies {
  int id;
  @JsonKey(name: 'logo_path')
  String logoPath;
  String name;
  @JsonKey(name: 'origin_country')
  String originCountry;

  ProductionCompanies({this.id = 0, this.logoPath = '', this.name = '', this.originCountry = ''});

  factory ProductionCompanies.fromJson(Map<String, dynamic> json) => _$ProductionCompaniesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompaniesToJson(this);

  @override
  String toString() => toJson().toString();
}

@JsonSerializable()
class GenreModel {
  final int? id;
  final String? name;

  GenreModel({this.id, this.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) => _$GenreModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenreModelToJson(this);
}
