import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../config/services/auth_service.dart';
import '../../jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';

class LoginController extends GetxController {
  final AuthServiceDataSource authService = Get.find<AuthServiceDataSource>();

  final loginFormKey = GlobalKey<FormState>();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  RxString errorPhoneNumberMessage = "".obs;
  RxString errorPasswordMessage = "".obs;

  void clearErrorPhoneNumber() => errorPhoneNumberMessage.value = '';

  void clearErrorPassword() => errorPasswordMessage.value = '';

  Rx<bool> agree = false as Rx<bool>;

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
    } else if ((GetUtils.isBlank(passwordController.text)) == true) {
      return errorPasswordMessage.value = "Add Password";
    } else {
      login(k);
    }
  }

  Future<void> login(Key? k) async {
    var phoneNumber = phoneNumberController.value.text;
    var password = passwordController.value.text;
    final userData = await authService.login(phoneNumber, password);
    userData.fold((l) {
      Get.snackbar("Signing in Error", "An error occurred during sign-in",
          overlayColor: Colors.red);
    }, (r) {
      navigatetoHomeScreen(k);
    });
  }

  navigatetoHomeScreen(Key? k) {
    Get.to(() => const JekawinBottomTabs(
      tabIndex: 0,
    ));
  }
}
