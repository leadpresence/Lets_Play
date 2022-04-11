import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jekawin_mobile_flutter/app/utils/simple_log_printer.dart';
import 'package:logger/logger.dart';
import 'dart:convert' as convert;

import '../config/exceptions/network_exceptions.dart';



void checkForNetworkExceptions(Response response) {
  if (response.statusCode! < 200 || response.statusCode! >= 400) {
    throw NetworkException('Failed to connect to internet');
  }
}

void showLoadingProgress(received, total) {
  if (total != -1) {
    if(dotenv.get('APP_DEBUG')  == 'true') {
      getLogger().d('${(received / total * 100).toStringAsFixed(0)}%');
    }
  }
}

dynamic decodeResponseBodyToJson(String body) {
  try {
    final data = convert.jsonDecode(body);
    return data;
  } on FormatException catch (e) {
    if(dotenv.get('APP_DEBUG') == 'true') {
      getLogger().e('Network Utils: Failed to decode response body ${e.message}');
    }
    throw NetworkException(e.message);
  }
}