import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

/// {@template app_dio_configurator.class}
/// The base class with client configuration of [Dio].
/// {@endtemplate}
class AppDioConfigurator {
  /// {@macro app_dio_configurator.class}
  const AppDioConfigurator();

  /// Creating a client [Dio].
  Dio create({
    required String url,
    String? proxyUrl,
    AsyncCallback? logout,
  }) {
    const timeout = Duration(seconds: 5);

    final dio = Dio();

    dio.options
      ..baseUrl = url
      ..responseType = ResponseType.json
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout;

    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      if (proxyUrl != null && proxyUrl.isNotEmpty) {
        client
          ..findProxy = (uri) {
            return 'PROXY $proxyUrl';
          }
          ..badCertificateCallback = (_, __, ___) {
            return true;
          };
      }

      return client;
    };

    final interceptors = <Interceptor>[];

    dio.interceptors.addAll(interceptors);

    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
    }

    return dio;
  }
}
