import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../app/constants.dart';

const String applicationJson = "application/json";
const String multipart = "multipart/form-data";
const String contentType = "content-type";
const String accept = "accept";
const String authorization = "authorization";
const String apiKeyHeader = "apiKey";

/// Dio handler
class DioFactory {
  Future<Dio> getDio(String url, String apiKey) async {
    Dio dio = Dio();

    ///header data
    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      apiKeyHeader: apiKey
    };

    dio.options = BaseOptions(
      baseUrl: url,
      headers: headers,
      receiveTimeout: const Duration(milliseconds: NetworkConstants.apiTimeout),
      sendTimeout: const Duration(milliseconds: NetworkConstants.apiTimeout),
    );

    ///logger while debug version
    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }

    return dio;
  }
}
