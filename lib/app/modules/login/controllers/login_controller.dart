import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jekawin_mobile_flutter/app/utils/helpers/text_helper.dart';
import '../../../config/services/auth_service.dart';
import '../../jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';

class LoginController extends GetxController {
  final AuthServiceImpl authService = Get.find<AuthServiceImpl>();
  RxString numberObserver = ''.obs;
  final loginFormKey = GlobalKey<FormState>();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  RxString errorPhoneNumberMessage = "".obs;
  RxString errorPasswordMessage = "".obs;
  var isLoading = false.obs;

  void clearErrorPhoneNumber() => errorPhoneNumberMessage.value = '';
  void clearErrorPassword() => errorPasswordMessage.value = '';

  bool observePhoneNumber(String str) {
    numberObserver.value = str;
    if (!numberObserver.value.startsWith('0')) {
      return false;
    }
    return true;
  }

  bool lengthObservePhoneNumber(String str) {
    numberObserver.value = str;
    if (numberObserver.value.length != 11) {
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  loginFormValidator(Key? k) {
    if ((GetUtils.isBlank(phoneNumberController.text)) == true) {
      return errorPhoneNumberMessage.value =
          '      Phone number field cannot be blank.';
    } else if (!phoneNumberController.text.startsWith('0')) {
      errorPhoneNumberMessage.value = "      Phone number must start with zero";
    } else if (phoneNumberController.text.length != 11) {
      errorPhoneNumberMessage.value = "      Phone number must be 11 digits";
    } else if ((GetUtils.isBlank(passwordController.text)) == true) {
      return errorPasswordMessage.value =
          "       Password field cannot be blank.";
    } else {
      login(k);
    }
  }


  Future<void> login(Key? k) async {
    isLoading.value = true;
    var phoneNumber = TextUtils()
        .stripFirstZeroAddCountryCode(number: phoneNumberController.value.text);
    var password = passwordController.value.text;
    final userData = await authService.signIn(phoneNumber, password);
    userData.fold(
      (l) {
        BotToast.showText(
          text: "Wrong Credentials ,try again!",
        );
        isLoading.value = false;
      },
      (r) {
        navigateToHomeScreen(k);
      },
    );
  }

  navigateToHomeScreen(Key? k) {
    phoneNumberController.text = '';
    passwordController.text = '';
    Get.offAll(
      () => JekawinBottomTabs(
        tabIndex: 0,
        isGuestUser: true,
      ),
      transition: Transition.cupertino,
    );
    isLoading.value = false;
  }
}
