import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/services/auth_service.dart';
import '../../../config/services/di/di_locator.dart';
import '../../e_shop/views/mobile/success_or_failure_mobile_view.dart';
import '../../jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';

class SignUpVerificationController extends GetxController
    with SingleGetTickerProviderMixin {
  final signUpOtpController = TextEditingController();
  final UtilsController utilsController = Get.find();
  final prospectIsProvider = Get.find<UtilsController>();

  final AuthServiceImpl authService = Get.find<AuthServiceImpl>();
  late Rx<AnimationController> animationController =
      AnimationController(vsync: this).obs;

  var isLoading = false.obs;
  var prospectId = "".obs;
  var phoneNumber = "".obs;
  var pin = "".obs;
  var remoteOtp = "".obs;

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
      () => SuccessOrFailureMobileView(
        msg: 'Registration successful',
        className: JekawinBottomTabs(
          tabIndex: 0,
          isGuestUser: true,
        ),
      ),
      transition: Transition.cupertino,
    );
  }

  void startTimer() {
    animationController.value = AnimationController(
        vsync: this,
        duration: const Duration(
          minutes: 5,
        ));
    animationController.value.forward();
  }

  @override
  void onInit() {
    startTimer();
    phoneNumber.value = utilsController.getPhoneNumber();
    prospectId.value = utilsController.getProspectId();
    super.onInit();
  }

  @override
  void onReady() {
    phoneNumber.value = utilsController.getPhoneNumber();
    prospectId.value = utilsController.getProspectId();
    super.onReady();
  }

  @override
  void dispose() {
    signUpOtpController.dispose();
    animationController.value.dispose();
    super.dispose();
  }
}
