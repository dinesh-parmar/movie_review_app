// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_theater_movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InTheaterMovies _$InTheaterMoviesFromJson(Map<String, dynamic> json) =>
    InTheaterMovies(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      dates: json['dates'] == null
          ? null
          : Dates.fromJson(json['dates'] as Map<String, dynamic>),
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );

Map<String, dynamic> _$InTheaterMoviesToJson(InTheaterMovies instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'dates': instance.dates,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };

Dates _$DatesFromJson(Map<String, dynamic> json) => Dates(
      maximum: json['maximum'] as String?,
      minimum: json['minimum'] as String?,
    );

Map<String, dynamic> _$DatesToJson(Dates instance) => <String, dynamic>{
      'maximum': instance.maximum,
      'minimum': instance.minimum,
    };
