import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jekawin_mobile_flutter/app/utils/helpers/text_helper.dart';
import '../../../config/services/auth_service.dart';
import '../../jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';

class LoginController extends GetxController {
  final AuthServiceImpl authService = Get.find<AuthServiceImpl>();

  RxString numberOberserver = ''.obs;

  final loginFormKey = GlobalKey<FormState>();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  RxString errorPhoneNumberMessage = "".obs;
  RxString errorPasswordMessage = "".obs;

  void clearErrorPhoneNumber() => errorPhoneNumberMessage.value = '';

  void clearErrorPassword() => errorPasswordMessage.value = '';

  bool observePhoneNumber(String str) {
    numberOberserver.value = str;
    if (!numberOberserver.value.startsWith('0')) {
      return false;
    }
    return true;
  }

  bool lengthObservePhoneNumber(String str) {
    numberOberserver.value = str;
    if (numberOberserver.value.length != 11) {
      return false;
    }
    return true;
  }

  @override
  void onInit() {
    // TODO: get user token from the local db
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  loginFormValidator(Key? k) {
    if ((GetUtils.isBlank(phoneNumberController.text)) == true) {
      return errorPhoneNumberMessage.value = 'Add Phone Number';
    } else if (!phoneNumberController.text.startsWith('0')) {
      errorPhoneNumberMessage.value = "Phone number must start with zero";
    } else if (phoneNumberController.text.length != 11) {
      errorPhoneNumberMessage.value = "Phone number must be 11 digits";
    } else if ((GetUtils.isBlank(passwordController.text)) == true) {
      return errorPasswordMessage.value = "Add Password";
    } else if (passwordController.text.length <= 4) {
      errorPasswordMessage.value = "Password is too short";
    } else {
      login(k);
    }
  }

  Future<void> login(Key? k) async {
    var phoneNumber = TextUtils()
        .stripFirstZeroAddCountryCode(number: phoneNumberController.value.text);
    var password = passwordController.value.text;
    final userData = await authService.login(phoneNumber, password);

    userData.fold((l) {
      Get.snackbar("Signing in Error", l.message,
          overlayColor: Colors.red);
    }, (r) {
      navigatetoHomeScreen(k);
    });
  }

  navigatetoHomeScreen(Key? k) {
    Get.to(
      () => const JekawinBottomTabs(
        tabIndex: 0,
        isGuestUser: true,
      ),
      transition: Transition.cupertino,
    );
  }
}
