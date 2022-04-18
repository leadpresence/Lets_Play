import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/config/services/auth_service.dart';
import 'package:jekawin_mobile_flutter/app/modules/signup/models/user_sign_up_model.dart';

import '../../signup_verification/views/mobile/signup_verification_mobile_portrait.dart';

class SignUpController extends GetxController {
  final  AuthServiceDataSource authService = Get.find<AuthServiceDataSource>();
  var agreementCheck = false.obs;
  final signUpFormKey = GlobalKey<FormState>();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  RxString errorPhoneNumberMessage = "".obs;
  RxString errorPasswordMessage = "".obs;

  void clearErrorPhoneNumber() => errorPhoneNumberMessage.value = '';

  void clearErrorPassword() => errorPasswordMessage.value = '';

  signUpFormValidator(Key? k) {
    if ((GetUtils.isBlank(phoneNumberController.text)) == true) {
      return errorPhoneNumberMessage.value = 'Add Phone Number';
    } else if ((GetUtils.isBlank(passwordController.text)) == true) {
      return errorPasswordMessage.value = "Add Password";
    } else {
      signUp(k);
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

  Future<void> signUp(Key? k) async {
    // CircularProgressIndicator();
    //todo @felix implement a  loading indicator here to shw progress
    var phoneNumber = phoneNumberController.value.text;
    var password = passwordController.value.text;
    var userAgreed = agreementCheck.value;
    final userData =await authService.signup(UserSignUpModel(firstname: "", lastname: "", mobile: phoneNumber, password: password, agreement: userAgreed));
    userData.fold((l) {
      Get.snackbar("Signup Error", "An error occurred during signup",overlayColor: Colors.red);
    }, (r) {
      navigateToVerify(k);
    });
  }

  navigateToVerify(Key? k){
    //check if terms is agreed
    if ( agreementCheck.value == true) {
      Get.to(() => SignupVerificationMP(
        key: k,
        phonenumber: phoneNumberController.text,
      ));
    }
    Get.snackbar("Terms & Conditions", "Agree to Jekawin terms and condition",overlayColor: Colors.yellow);
  }

}
