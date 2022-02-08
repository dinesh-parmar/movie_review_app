import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_review_app/dio/api_key_interceptor.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:dio/dio.dart';

Future<void> showSimpleDialog(String? title, String? message) => RM.navigate.toDialog(
      AlertDialog(
        title: Text(title ?? ""),
        content: Text(message ?? "", style: const TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            child: const Text("Ok"),
            onPressed: () => Navigator.of(RM.context!, rootNavigator: true).pop(),
          )
        ],
      ),
    );

Dio buildDio() {
  final Dio dio = Dio();
  if (kDebugMode) dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  dio.interceptors.add(ApiKeyInterceptor(apiKey: const String.fromEnvironment("TMDB_API_KEY")));
  return dio;
}

String serviceApi(String serviceName, [int? versionCode]) => "https://api.themoviedb.org/${(versionCode ?? 3).toString()}/$serviceName";
