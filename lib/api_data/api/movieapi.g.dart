// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movieapi.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _Movieapi implements Movieapi {
  _Movieapi(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<MoviesResp> getMoviesForService(serviceName, pageNo) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': pageNo};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MoviesResp>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/${serviceName}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MoviesResp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FullMovieDetail> getMovieDetails(movieId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FullMovieDetail>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/${movieId}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FullMovieDetail.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ReviewsResponse> getReviews(movieId, pageNo) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': pageNo};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ReviewsResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/${movieId}/reviews',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ReviewsResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
