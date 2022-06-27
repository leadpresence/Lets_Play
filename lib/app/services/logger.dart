import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  final int _maxCharactersPerLine = 200;

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    String responseAsString = response.data.toString();
    if (responseAsString.length > _maxCharactersPerLine) {
      int iterations =
          (responseAsString.length / _maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * _maxCharactersPerLine + _maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
      }
    } else {
      if (kDebugMode) {
        print(response.data);
      }
    }
    if (kDebugMode) {
      print("<-- END HTTP");
    }

    super.onResponse(response, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print("HEADER --> ${options.method} ${options.headers}");
      print("PATH --> ${options.method} ${options.path}");
      print("DATA --> ${options.data} ${options.data}");
      print(
          "qweryPara --> ${options.queryParameters} ${options.queryParameters}");
      print("Content type: ${options.contentType}");
      print("<-- END HTTP");
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print("<-- Error -->");
      print(err.error);
      print(err.message);
    }

    super.onError(err, handler);
  }
}
