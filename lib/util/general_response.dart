import 'package:dio/dio.dart';
import 'package:movie_review_app/model/response/api_error.dart';
import 'package:movie_review_app/util/helpers.dart';

class GeneralResponse<T> {
  T? data;
  DioError? dioError;
  ApiError? apiError;
  final bool success;
  final int statusCode;

  GeneralResponse({this.data, this.dioError, this.apiError, required this.statusCode, required this.success});

  Future<void> showErrorDialog() async {
    if (apiError != null) {
      return showSimpleDialog("Status: ${apiError?.status}", apiError!.statusMessage);
    }
  }
}
