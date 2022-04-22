import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/services/auth_service.dart';
import '../../../config/services/di/di_locator.dart';
import '../../otp_reset_password/views/password_reset_success_or_failure_mobile_view.dart';

class SignUpVerificationController extends GetxController {
  final signUpOtpController = TextEditingController();

  final ProspectIdController prospectIdController = Get.find();
  final AuthServiceDataSource authService = Get.find<AuthServiceDataSource>();

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
      Get.snackbar("Signup Error", l.message, overlayColor: Colors.red);
    }, (r) {
      navigateToSignUpSuccessful(key);
    });
  }

  void navigateToSignUpSuccessful(Key? key) {
    Get.to(() => const VerificationSuccessOrFailureMobileView(message: "Registration successful",));
  }
}
