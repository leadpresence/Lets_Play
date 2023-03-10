import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:jekawin_mobile_flutter/app/config/services/e_shop_service.dart';
import 'package:jekawin_mobile_flutter/app/config/services/subscriber_service.dart';
import 'package:jekawin_mobile_flutter/app/config/services/wallet_service.dart';
import 'package:jekawin_mobile_flutter/app/modules/wallet_home/models/transaction_model.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../init_db.dart';
import '../../../modules/add_bank_acccount/models/bank_response_model.dart';
import '../../../modules/wallet_home/models/user_wallet_response.dart';
import '../../data/local/user_local_impl.dart';
import '../auth_service.dart';
import '../http/http_service_impl.dart';
import '../http/http_services.dart';

class UtilsController extends GetxController {
  UtilsController();
  RxString prospectId = "".obs;
  RxString otp = "".obs;
  RxString phoneNumber = "".obs;
  RxString forgotPasswordToken = "".obs;
  RxString recentPaymentLink = "".obs;
  RxString walletId = "".obs;
  RxString accountName = "".obs;
  RxString email = "".obs;
  RxString gender = "".obs;
  RxString homeAddress = "".obs;
  RxString profileUrl = "".obs;

  RxList guestLists = [].obs;
  // RxList transactions = [].obs;
  Rx<List<Bank>> banks = Rx<List<Bank>>([]);
  Rx<List<BankResponse>> savedBanks = Rx<List<BankResponse>>([]);
  Rx<List<BankResponse>> withdrawalAccount = Rx<List<BankResponse>>([]);
  Rx<List<TransactionsModel>> transactions = Rx<List<TransactionsModel>>([]);
  RxList paymentProcessors = [].obs;

  getProspectId() => prospectId.value;
  getResentPaymentLink() => recentPaymentLink.value;
  getOtp() => otp.value;
  getForgotPasswordToken() => forgotPasswordToken.value;
  getPhoneNumber() => phoneNumber.value;
  getEmail() => email.value;

  setGender(String genderVal) => gender.value = genderVal;
  setHomeAddress(String homeAddressVal) => homeAddress.value = homeAddressVal;
  setProfileUrl(String profileUrlVal) => profileUrl.value = profileUrlVal;

  getGender() => gender.value;
  getHomeAddress() => homeAddress.value;
  getProfileUrl() => profileUrl.value;

  setProspectId(String prosId) {
    prospectId.value = prosId;
  }

  setRecentPaymentLink(String link) {
    recentPaymentLink.value = link;
  }

  setEmail(String emailT) {
    email.value = emailT;
  }

  setOtp(String otpCode) {
    otp.value = otpCode;
  }

  setForgotPasswordToken(String token) {
    forgotPasswordToken.value = token;
  }

  setPhoneNumber(String mobile) {
    phoneNumber.value = mobile;
  }
}

//order matters here
Future<void> setDi() async {
  Directory appDocDir = dotenv.get('APP_DEBUG') == 'true'
      ? Directory.current
      : await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  Get.lazyPut<HiveInterface>(() => Hive);
  initHiveDb();
  Get.put(UserLocalDataSourceImpl());
  Get.lazyPut<HttpService>(() => HttpServiceImpl());
  Get.lazyPut<UtilsController>(() => UtilsController());
  Get.put(AuthServiceImpl());
  Get.put(EshopServiceImpl());
  Get.put(WalletServiceImpl());
  Get.put(SubscriberServiceImpl());
}

