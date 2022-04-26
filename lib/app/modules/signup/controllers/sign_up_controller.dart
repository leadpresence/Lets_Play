import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jekawin_mobile_flutter/app/config/services/auth_service.dart';
import 'package:jekawin_mobile_flutter/app/modules/signup/models/user_sign_up_model.dart';

import '../../../utils/helpers/text_helper.dart';
import '../../signup_verification/views/mobile/signup_verification_mobile_portrait.dart';

class SignUpController extends GetxController {
  final AuthServiceImpl authService = Get.find<AuthServiceImpl>();
  var agreementCheck = false.obs;
  final signUpFormKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  RxString errorFirstNameMessage = "".obs;
  RxString errorLastNameMessage = "".obs;
  RxString errorPhoneNumberMessage = "".obs;
  RxString errorPasswordMessage = "".obs;

  void clearErrorPhoneNumber() => errorPhoneNumberMessage.value = '';
  void clearErrorFirstName() => errorPhoneNumberMessage.value = '';
  void clearErrorPassword() => errorPasswordMessage.value = '';
  void clearErrorLastName() => errorPasswordMessage.value = '';

  signUpFormValidator(Key? k) {
    if ((GetUtils.isBlank(phoneNumberController.text)) == true) {
      return errorPhoneNumberMessage.value = 'Add Phone Number';
    } else if ((GetUtils.isBlank(firstNameController.text)) == true) {
      GetStorage().write("firstname", firstNameController.text);
      return errorFirstNameMessage.value = "What can we call you?";
    } else if ((GetUtils.isBlank(passwordController.text)) == true) {
      return errorPasswordMessage.value = "Add Password";
    } else if (agreementCheck.value != true) {
      //check if terms is agreed
      Get.snackbar("Terms & Conditions", "Agree to Jekawin terms and condition",
          overlayColor: Colors.yellow);
    } else {
      signUp(k);
    }
  }

  Rx<bool> agree = false.obs;

  @override
  void onInit() {
    isLoading.value = false;
    clearErrorPhoneNumber();
    clearErrorFirstName();
    clearErrorPassword();
    clearErrorLastName();
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
    isLoading.value = false;
    super.dispose();
  }

  @override
  void onClose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    isLoading.value = false;
    super.onClose();
  }

  Future<void> signUp(Key? k) async {
    var firstName = firstNameController.value.text;
    var lastName = lastNameController.value.text;
    var phoneNumber = TextUtils()
        .stripFirstZeroAddCountryCode(number: phoneNumberController.value.text);
    var password = passwordController.value.text;
    var userAgreed = agreementCheck.value;
    isLoading(true);
    final userData = await authService.signup(UserSignUpModel(
      firstname: firstName,
      lastname: lastName,
      mobile: phoneNumber,
      password: password,
      agreement: userAgreed,
    ));
    userData.fold((l) {
      isLoading(false);

      Get.snackbar("Signup Error", l.message,
          overlayColor: Colors.red);
    }, (r) {
      navigateToVerify(k);
    });
  }

  navigateToVerify(Key? k) {
    Get.to(() => SignupVerificationMP(
          key: k,
          phonenumber: phoneNumberController.text,
        ));
  }
}
