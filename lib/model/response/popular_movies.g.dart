// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularMovies _$PopularMoviesFromJson(Map<String, dynamic> json) =>
    PopularMovies(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: json['total_results'] as int?,
      totalPages: json['totalPages'] as int?,
    );

Map<String, dynamic> _$PopularMoviesToJson(PopularMovies instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_results': instance.totalResults,
      'totalPages': instance.totalPages,
    };
