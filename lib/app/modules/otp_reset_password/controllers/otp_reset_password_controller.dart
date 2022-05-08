import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../config/services/auth_service.dart';
import '../../../config/services/di/di_locator.dart';
import '../../new_password/views/new_password.dart';

class OtpResetPasswordController extends GetxController {
  final AuthServiceImpl authService = Get.find<AuthServiceImpl>();
  final UtilsController prospectIsProvider =
      Get.find<UtilsController>();
  final otpController = TextEditingController();

  var otp = "".obs;

  setOtp(String otpString) {
    otp.value = otpString;
  }

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

  Future<void> verifyResetPasswordOtp(Key? k) async {
    final response =
        await authService.verifyResetPasswordOtp(otpController.text);
    response.fold((l) {
      BotToast.showText(text: l.message);
    }, (r) {
      navigateToUpdatePassword(k);
    });
  }

  void navigateToUpdatePassword(Key? k) {
    Get.to(() => const UpdatePasswordView());
  }
}
