import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../config/services/auth_service.dart';
import '../../../config/services/di/di_locator.dart';
import '../../new_password/views/new_password.dart';

class OtpResetPasswordController extends GetxController
    with SingleGetTickerProviderMixin {
  final AuthServiceImpl authService = Get.find<AuthServiceImpl>();
  final ProspectIdController prospectIsProvider =
      Get.find<ProspectIdController>();
  final otpController = TextEditingController();
  late Rx<AnimationController> animationController =
      AnimationController(vsync: this).obs;
  var otp = "".obs;

  setOtp(String otpString) {
    otp.value = otpString;
  }

  Rx<bool> agree = false.obs;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  @override
  void dispose() {
    animationController.value.dispose();
    super.dispose();
  }

  void startTimer() {
    animationController.value = AnimationController(
        vsync: this,
        duration: const Duration(
          minutes: 30,
        ));
    animationController.value.forward();
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
