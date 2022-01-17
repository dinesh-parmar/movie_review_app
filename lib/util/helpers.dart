import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_review_app/dio/api_key_interceptor.dart';
import 'package:movie_review_app/util/secrets.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:dio/dio.dart';

void showSimpleDialog(String? title, String? message) async => RM.navigate.toDialog(
      AlertDialog(
        title: Text(title ?? ""),
        content: Text(message ?? ""),
        actions: [
          TextButton(
            child: const Text("Ok"),
            onPressed: () => RM.navigate.back(),
          )
        ],
      ),
    );

Dio buildDio() {
  final Dio dio = Dio();
  if (kDebugMode) dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  dio.interceptors.add(ApiKeyInterceptor(apiKey: API_KEY));

  return dio;
}

String serviceApi(String serviceName, [int? versionCode]) => "https://api.themoviedb.org/${(versionCode ?? 3).toString()}/$serviceName";
