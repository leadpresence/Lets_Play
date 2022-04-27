import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/utils/helpers/text_helper.dart';

import '../../../config/services/auth_service.dart';
import '../../../config/services/di/di_locator.dart';
import '../../otp_reset_password/views/otp_reset_password.dart';

class ResetPasswordController extends GetxController {
  final AuthServiceImpl authService = Get.find<AuthServiceImpl>();
  final ProspectIdController prospectIsProvider =
      Get.find<ProspectIdController>();
  final TextEditingController phoneNumberController = TextEditingController();

  Rx<bool> agree = false.obs;
  RxString userPhoneNumber = "".obs;


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

  Future<void> requestForgotPasswordOtp(Key? k) async {
    var phoneNumber = TextUtils()
        .stripFirstZeroAddCountryCode(number: phoneNumberController.text);
    final response = await authService.forgetPassword(phoneNumber);
    response.fold((l) {
      BotToast.showText(text: l.message);
    }, (r)  {
      var mobile = prospectIsProvider.getPhoneNumber();
      userPhoneNumber.value =  mobile;
      navigateToResetPassword(k);});
  }

  Future<void> updateForgotPassword(Key? k) async {}

  navigateToResetPassword(Key? k) {
    Get.to(
          () => OtpResetPasswordView(key: k,
        phoneNumber:  userPhoneNumber.value.toString(),
      ),
    );
  }
  }


