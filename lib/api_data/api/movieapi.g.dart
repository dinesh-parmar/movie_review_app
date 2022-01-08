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
  Future<PopularMovies> getPopularMovies(pageNo) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': pageNo};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PopularMovies>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/popular',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PopularMovies.fromJson(_result.data!);
    return value;
  }

  @override
  Future<InTheaterMovies> getInTheaterMovies(pageNo) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': pageNo};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<InTheaterMovies>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/now_playing',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = InTheaterMovies.fromJson(_result.data!);
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
