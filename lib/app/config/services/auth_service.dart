import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/config/services/http/base_urls.dart';
import 'package:jekawin_mobile_flutter/app/config/services/http/http_service_impl.dart';
import 'package:jekawin_mobile_flutter/app/config/services/http/http_services.dart';

import '../../modules/signup/models/user_sign_up_model.dart';

class AuthService extends HttpServiceImpl {
  final httpProvider = Get.put(HttpServiceImpl());

  Future<dynamic> signUp(UserSignUpModel body) async {
    try {
      var res = httpProvider.postHttp(
          "${JekawinBaseUrls.stagingBaseUrl}signup", body);
      return res;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }
}
