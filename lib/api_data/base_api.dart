import 'package:movie_review_app/model/response/api_error.dart';
import 'package:movie_review_app/util/general_response.dart';
import 'package:dio/dio.dart';

mixin BaseApi {
  Future<GeneralResponse<T>> loadResponse<T>(Future<T> Function() executor) async {
    GeneralResponse<T> resp;
    try {
      resp = GeneralResponse(data: await executor(), statusCode: 200, success: true);
    } on DioError catch (e) {
      ApiError? apiError;
      if (e.response != null && e.response?.data != null && e.response?.data is Map<String, dynamic>) {
        apiError = ApiError.fromJson(e.response!.data);
      }
      resp = GeneralResponse(statusCode: e.response!.statusCode ?? 400, dioError: e, apiError: apiError, success: apiError?.status ?? false);
    }
    return resp;
  }
}
