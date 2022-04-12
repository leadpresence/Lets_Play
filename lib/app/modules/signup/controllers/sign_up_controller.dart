import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/config/services/auth_service.dart';

class SignUpController extends GetxController {
  final AuthService authService = Get.put(AuthService());
  var agreementCheck = false.obs;
  final signUpFormKey = GlobalKey<FormState>();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  RxString errorPhoneNumberMessage = "".obs;
  RxString errorPasswordMessage = "".obs;

  void clearErrorPhoneNumber() => errorPhoneNumberMessage.value = '';
  void clearErrorPassword() => errorPasswordMessage.value = '';

  signUpFormValidator() {
    if (GetUtils.isBlank(phoneNumberController.text)) {
      return errorPhoneNumberMessage.value = 'Add Phone Number';
    } else if (GetUtils.isBlank(passwordController.text)) {
      return errorPasswordMessage.value = "Add Password";
    }
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
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? validator(String value) {
    if (value.isEmpty) {
      return 'Please this field must be filled';
    } else if (value.length < 4) {
      return 'Input is toon short';
    }
    return null;
  }

  void signUp() {
    if (signUpFormKey.currentState!.validate()) {
      //  https://stackoverflow.com/questions/69547879/dart-the-method-validate-cant-be-unconditionally-invoked-because-the-receiver
      signUpFormKey.currentState!.save();
      checkUser(phoneNumberController.text, passwordController.text)
          .then((auth) {
        if (auth) {
          Get.snackbar('Sign up', 'Sign up successfully');
        } else {
          Get.snackbar('Sign up', 'Invalid phone or password');
        }
        passwordController.clear();
      });
    }
  }

  // Api Simulation
  Future<bool> checkUser(String user, String password) {
    if (user == 'foo@foo.com' && password == '123') {
      return Future.value(true);
    }
    return Future.value(false);
  }
}
