import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/services/auth_service.dart';
import '../../../config/services/di/di_locator.dart';
import '../../e_shop/views/mobile/success_or_failure_mobile_view.dart';
import '../../jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';

class SignUpVerificationController extends GetxController {
  final signUpOtpController = TextEditingController();

  final ProspectIdController prospectIdController = Get.find();
  final AuthServiceImpl authService = Get.find<AuthServiceImpl>();

  var isLoading = false.obs;
  var prospectId = "".obs;
  var phoneNumber = "".obs;
  var pin = "".obs;

  setOtp(String otpPin) {
    pin.value = otpPin;
  }

  Future<void> completeSignUp(Key? key) async {
    isLoading.value = true;
    var otp = signUpOtpController.text;
    final userData = await authService.verifySignUpOtp(otp);
    userData.fold((l) {
      isLoading.value = false;
      BotToast.showText(text: l.message);
    }, (r) {
      navigateToSignUpSuccessful(key);
      isLoading.value = false;
    });
  }

  void navigateToSignUpSuccessful(Key? key) {
    Get.to(
      () => const SuccessOrFailureMobileView(
        msg: 'Registration successful',
        className: JekawinBottomTabs(
          tabIndex: 0,
          isGuestUser: true,
        ),
      ),
      transition: Transition.cupertino,
    );
  }

  @override
  void onInit() {
    phoneNumber.value = prospectIdController.getPhoneNumber();
    prospectId.value = prospectIdController.getProspectId();
    super.onInit();
  }

  @override
  void onReady() {
    phoneNumber.value = prospectIdController.getPhoneNumber();
    prospectId.value = prospectIdController.getProspectId();
    super.onReady();
  }

  @override
  void dispose() {
    signUpOtpController.dispose();
    super.dispose();
  }
}
