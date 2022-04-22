import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OtpResetPasswordController extends GetxController {
  final otpController = TextEditingController();

  var agreementCheck = false.obs;

  Rx<bool> agree = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}