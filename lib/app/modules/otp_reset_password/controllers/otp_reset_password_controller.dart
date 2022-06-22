import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../config/services/auth_service.dart';
import '../../../config/services/di/di_locator.dart';
import '../../new_password/views/new_password.dart';

class OtpResetPasswordController extends GetxController
    with SingleGetTickerProviderMixin {
  final AuthServiceImpl authService = Get.find<AuthServiceImpl>();
  final UtilsController prospectIsProvider =
      Get.find<UtilsController>();
  final otpController = TextEditingController();
  late Rx<AnimationController> animationController =
      AnimationController(vsync: this).obs;
  var otp = "".obs;
  var prospectId = "".obs;
  var remoteOtp = "".obs;


  setOtp(String otpString) {
    // otp.value = otpString;
    otp.value = prospectIsProvider.getOtp();
  }

  Rx<bool> agree = false.obs;

  @override
  void onInit() {
    startTimer();
    remoteOtp.value = prospectIsProvider.getOtp();
    otpController.text=remoteOtp.value.toString();
    super.onInit();
  }

  @override
  void onReady() {
    prospectId.value = prospectIsProvider .getProspectId();
    super.onReady();
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
          minutes: 2,
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
