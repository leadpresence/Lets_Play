import 'package:dio/dio.dart';
// import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/utils/simple_log_printer.dart';
// import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../utils/ui/snack_bars.dart';
import '../../data/model/hive_boxes.dart';
import '../../exceptions/network_exceptions.dart';
import 'http_services.dart';
import 'package:jekawin_mobile_flutter/app/utils/network_utils.dart' as network_utils;



class HttpServiceImpl extends HttpService {

  // final user = Get.find(tag:HiveBox.USER_BOX);

  final _dio = Dio(BaseOptions(connectTimeout: 50000));

  @override
  setHeader() {
    // _userServiceService.getUser();
    // Map<String, dynamic> header = {
    //   'Content-Type': 'application/json',
    //   'Accept': 'application/json',
    // };
    //
    // if ( this.user != null ) {
    //   header['Authorization'] = 'Bearer ${this.user.token}';
    // }
    // _dio.options.headers.addAll(header);
  }

  @override
  void dispose() {
    _dio.clear();
    _dio.close(force: true);
  }

  @override
  clearHeaders() {
    _dio.options.headers.clear();
  }

  @override
  Future<dynamic> getHttp(String route, {Map<String, dynamic>? params, bool refreshed: false}) async {
    Response response;
    params?.removeWhere((key, value) => value == null);
    final fullRoute = '${dotenv.get('API')}$route';
    if(dotenv.get('APP_DEBUG') == 'true') {
      getLogger().d('[GET] Sending $params to $fullRoute');
    }


    try {
      setHeader();
      response = await _dio.get(
        fullRoute,
        queryParameters: params,
        options: Options(
          contentType: 'application/json',
        ),
      );
    } on DioError catch (e) {

      if(dotenv.get('APP_DEBUG') == 'true') {
       getLogger().e('HttpService: Failed to GET $fullRoute: Error message: ${e.message}');
      }

      if(dotenv.get('APP_DEBUG') == 'true') {
        debugPrint('Http response data is: ${e.response?.data}');
      }

      if (e.response?.statusCode == 401) {
        //todo felix navigate to response screen with status false
        // _navigationService.clearStackAndShow(Routes.authenticate);
        // return AuthException('Invalid token and credentials');
      }

      throw NetworkException( e.message); //e.response?.data != null ? e.response.data['message'] ?? e.message : e.message
    }

    if(dotenv.get('APP_DEBUG') == 'true') {
     getLogger().d('Received Response: $response');
    }

    network_utils.checkForNetworkExceptions(response);

    return response.data;
    // return network_utils.decodeResponseBodyToJson(response.data);
  }

  @override
  Future<dynamic> postHttp(String route, dynamic body, {Map<String, dynamic>? params}) async {
    Response response;
    params?.removeWhere((key, value) => value == null);
    body?.removeWhere((key, value) => value == null);
    final fullRoute = '${dotenv.get('API')}$route';
    // debugPrint('[POST] Sending $body to $fullRoute');
    if(dotenv.get('APP_DEBUG') == 'true') {
     getLogger().d('[POST] Sending $body to $fullRoute');
    }


    try {
      setHeader();

      response = await _dio.post(
        fullRoute,
        data: body,
        queryParameters: params,
        onSendProgress: network_utils.showLoadingProgress,
        onReceiveProgress: network_utils.showLoadingProgress,
        options: Options(
          contentType: 'application/json',
        ),
      );
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        // _navigationService.clearStackAndShow(Routes.authenticate);
        // throw AuthException('Invalid token and credentials');
      }
      if(dotenv.get('APP_DEBUG') == 'true') {
       getLogger().e('HttpService: Failed to POST ${e.response?.data['message']}');
      }


      if(dotenv.get('APP_DEBUG') == 'true') {
        debugPrint('Http response data is: ${e.message}');
      }

      // return e.response?.data;
      throw NetworkException(e.response?.data != null ? e.response?.data['message'] ?? e.message : e.message);
    }

    // network_utils.checkForNetworkExceptions(response);
    if(dotenv.get('APP_DEBUG') == 'true') {
     getLogger().d('Received Response: $response');
    }


    return response?.data;
    // return network_utils.decodeResponseBodyToJson(response.data);
  }

  @override
  Future putHttp(String route, body, {Map<String, dynamic>? params, refreshed: false}) async {
    Response? response;
    params?.removeWhere((key, value) => value == null);
    body?.removeWhere((key, value) => value == null);

   getLogger().d('[PUT] Sending $body to $route');

    try {
      setHeader();
      final fullRoute = '${dotenv.get('API')}$route';
      response = await _dio.put(
        fullRoute,
        data: body,
        queryParameters: params,
        onSendProgress: network_utils.showLoadingProgress,
        onReceiveProgress: network_utils.showLoadingProgress,
        options: Options(
          contentType: 'application/json',
        ),
      );
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        // _navigationService.clearStackAndShow(Routes.signinViewRoute);
        // throw AuthException('Invalid token and credentials');
      }
     getLogger().e('HttpService: Failed to PUT ${e.message}');
      debugPrint('Http response data is: ${e.response?.data}');
      // throw NetworkException(e.response?.data != null ? e.response.data['message'] ?? e.message : e.message);
    }

    network_utils.checkForNetworkExceptions(response!);

    return network_utils.decodeResponseBodyToJson(response.data);
  }

  @override
  Future deleteHttp(String route, {Map<String, dynamic>? params, refreshed: false}) async {
    Response? response;
    params?.removeWhere((key, value) => value == null);

   getLogger().d('[DELETE] Sending $params to $route');

    try {
      setHeader();
      final fullRoute = '${dotenv.get('API')}$route';
      response = await _dio.delete(
        fullRoute,
        queryParameters: params,
        options: Options(
          contentType: 'application/json',
        ),
      );
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        // _navigationService.clearStackAndShow(Routes.signinViewRoute);
        // throw AuthException('Invalid token and credentials');
      }
     getLogger().e('HttpService: Failed to DELETE $route: Error message: ${e.message}');
      debugPrint('Http response data is: ${e.response?.data}');
      // throw NetworkException(e.response?.data != null ? e.response.data['message'] ?? e.message : e.message);
    }

    network_utils.checkForNetworkExceptions(response!);

   getLogger().d('Received Response: $response');

    return network_utils.decodeResponseBodyToJson(response.data);
  }
}


handleError(DioError error) {
  if (kDebugMode) {
    print(error.response.toString());
  }
  if (error.message.contains('SocketException')) {
    return JekawinSnackBars.noInternet(
      message:
      'We cannot detect internet connection. Seems like you are offline.',
      message2: 'Please retry.',
    );
  }

  if (error.type == DioErrorType.connectTimeout) {
    return JekawinSnackBars.noInternet(
      message: 'Connection timed out. Seems like you are offline.',
      message2: 'Please retry.',
    );
  }

  if (error.response == null || error.response.data is String) {
    return JekawinSnackBars.noInternet(
      message: 'Something went wrong.',
      message2: 'Please try again later',
    );
  }
  return JekawinSnackBars.noInternet(
      message: 'Something went wrong.', message2: 'Please try again later');
}