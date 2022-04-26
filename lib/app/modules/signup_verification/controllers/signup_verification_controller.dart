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

  Future<void> completeSignUp(Key? key) async {
    var otp = signUpOtpController.text;
    final userData = await authService.verifySignUpOtp(otp);
    userData.fold((l) {
      isLoading(false);
      Get.snackbar("OTP verification", l.message, overlayColor: Colors.red);
    }, (r) {
      navigateToSignUpSuccessful(key);
    });
  }

  void navigateToSignUpSuccessful(Key? key) {
    Get.to(
      () => const SuccessOrFailureMobileView(
        msg: 'You have successfully shared 0 RPT',
        className: JekawinBottomTabs(
          tabIndex: 0,
          isGuestUser: true,
        ),
      ),
      transition: Transition.cupertino,
    );
  }
}
