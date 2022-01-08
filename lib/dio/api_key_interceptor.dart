import 'package:dio/dio.dart';

class ApiKeyInterceptor extends Interceptor {
  static String forceLoggedOutMessage = "refresh_token_api_error";

  String? apiKey;

  ApiKeyInterceptor({this.apiKey});

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.queryParameters["api_key"] = apiKey;
    return handler.next(options);
  }
}
