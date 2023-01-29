import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'local_storage.dart';
import 'logger.dart';

class BaseService {
  String baseUrlTest = "http://50.16.121.213:3500/";
  final Dio _dio = Dio(BaseOptions(
      baseUrl: "http://50.16.121.213:3500/",
      validateStatus: (status) {
        return status! < 500;
      },
      headers: {
        "Accept": "*/*",
        "Content-Type": "application/json",
        "Connection": "keep-alive",
      },
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000))
    ..interceptors.add(LoggingInterceptor()
    );

  Future<Response> request(
    String url, {
    dynamic body,
    required String method,
  }) async {
    var token = await LocalStorage.getToken();
    var email = await LocalStorage.getEmail();
    var gameSession = await LocalStorage.getGameSession();
    var userID = await LocalStorage.getUserId();
    var res = _dio.request(
      url,
      data: body,
      options: Options(
        method: method,
        headers: token != null &&
                userID != null &&
                email != null &&
                gameSession != null
            ? {
                'authorization': 'Bearer $token',
                'userid': userID,
                'gameSession': gameSession,
                'email': email
              }
            : token != null && userID != null && email != null
                ? {
                    'authorization': 'Bearer $token',
                    'userid': userID,
                    'email': email
                  }
                : token != null && gameSession != null && email != null
                    ? {
                        'authorization': 'Bearer $token',
                        'gameSession': gameSession,
                        'email': email
                      }
                    : token != null && email != null
                        ? {'authorization': 'Bearer $token', 'email': email}
                        : token != null
                            ? {'authorization': 'Bearer $token'}
                            : null,
      ),
    );
    return res;
  }
}

handleError(DioError error) {
  if (kDebugMode) {
    print(error.response.toString());
  }
  if (error.message.contains('SocketException')) {
    return BotToast.showText(
      text: 'We cannot detect internet connection. Seems like you are offline.',
    );
  }

  if (error.type == DioErrorType.connectTimeout) {
    return BotToast.showText(
      text: 'Connection timed out. Seems like you are offline.',
    );
  }

  if (error.response == null || error.response!.data is String) {
    return BotToast.showText(
      text: 'Something went wrong. Please try again later',
    );
  }
  return BotToast.showText(
      text: 'Something went wrong. Please try again later');
}
