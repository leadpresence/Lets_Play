import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:jekawin_mobile_flutter/app/config/services/subscriber_service.dart';
import 'package:jekawin_mobile_flutter/app/modules/referral/models/ReferralResponse.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../init_db.dart';
import '../../data/local/user_local_impl.dart';
import '../auth_service.dart';
import '../http/http_service_impl.dart';
import '../http/http_services.dart';

class UtilsController extends GetxController {
  UtilsController();
  RxString prospectId = "".obs;
  RxString phoneNumber = "".obs;
  RxString forgotPasswordToken = "".obs;

  RxList guestLists = [].obs;

  getProspectId() => prospectId.value;
  getForgotPasswordToken() => forgotPasswordToken.value;

  getPhoneNumber() => phoneNumber.value;

  setProspectId(String prosId) {
    prospectId .value= prosId;
  }
  setForgotPasswordToken(String token) {
    forgotPasswordToken .value= token;
  }

  setPhoneNumber(String mobile) {
    phoneNumber.value = mobile;
  }
}
//order matters here
Future<void>  setDi()async {
  Directory appDocDir = dotenv.get('APP_DEBUG') == 'true' ? Directory.current : await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  Get.lazyPut<HiveInterface>(()=>Hive);
  initHiveDb();
  Get.put(UserLocalDataSourceImpl());
  Get.lazyPut<HttpService>(()=>HttpServiceImpl());
  Get.lazyPut<UtilsController> (()=>UtilsController());
  Get.put (AuthServiceImpl());
  Get.put (SubscriberServiceImpl());
}