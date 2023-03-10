import 'package:bot_toast/bot_toast.dart';
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
  final inviteCodeController = TextEditingController();

  var isLoading = false.obs;
  RxString errorfirstNameMessage = "".obs;
  RxString errorlastNameMessage = "".obs;
  RxString errorPhoneNumberMessage = "".obs;
  RxString errorPasswordMessage = "".obs;

  void clearErrorPhoneNumber() => errorPhoneNumberMessage.value = '';
  void clearErrorfirstName() => errorfirstNameMessage.value = '';
  void clearErrorPassword() => errorPasswordMessage.value = '';
  void clearErrorlastName() => errorlastNameMessage.value = '';

  signUpFormValidator(Key? k) {
    if ((GetUtils.isBlank(firstNameController.text)) == true) {
      GetStorage().write("firstName", firstNameController.text);
      return errorfirstNameMessage.value =
          "      First name field cannot be blank.";
    } else if ((GetUtils.isBlank(phoneNumberController.text)) == true) {
      return errorPhoneNumberMessage.value =
          "      Phone number field cannot be blank.";
    } else if (!phoneNumberController.text.startsWith('0')) {
      errorPhoneNumberMessage.value = "      Phone number must start with zero";
    } else if (phoneNumberController.text.length != 11) {
      errorPhoneNumberMessage.value = "      Phone number must be 11 digits";
    } else if ((GetUtils.isBlank(passwordController.text)) == true) {
      return errorPasswordMessage.value =
          "      Password field cannot be blank.";
    } else if (agreementCheck.value != true) {
      BotToast.showText(text: "Agree to Jekawin Terms & Conditions");
    } else {
      GetStorage().write('homeAddress', '');
      GetStorage().write('gender', '');
      signUp(k);
    }
  }

  Rx<bool> agree = false.obs;

  @override
  void onInit() {
    isLoading.value = false;
    clearErrorPhoneNumber();
    clearErrorfirstName();
    clearErrorPassword();
    clearErrorlastName();
    super.onInit();
  }

  // @override
  // void dispose() {
  //   phoneNumberController.dispose();
  //   passwordController.dispose();
  //   isLoading.value = false;
  //   super.dispose();
  // }
  //
  // @override
  // void onClose() {
  //   phoneNumberController.dispose();
  //   passwordController.dispose();
  //   isLoading.value = false;
  //   super.onClose();
  // }

  Future<void> signUp(Key? k) async {
    var firstName = firstNameController.value.text;
    var lastName = lastNameController.value.text;
    var referralCode = inviteCodeController.value.text;
    var phoneNumber = TextUtils()
        .stripFirstZeroAddCountryCode(number: phoneNumberController.value.text);
    var password = passwordController.value.text;
    var userAgreed = agreementCheck.value;
    isLoading(true);
    final userData = await authService.signup(UserSignUpModel(
      firstName: firstName,
      lastName: lastName,
      phone: phoneNumber,
      password: password,
      referralCode: referralCode,
      agreement: userAgreed,
    ));
    userData.fold((l) {
      isLoading(false);
      BotToast.showText(text: l.message);
    }, (r) {
      navigateToVerify(k);
      isLoading(false);
    });
  }

  Future<void> resendSignUp(Key? k) async {
    var firstName = firstNameController.value.text;
    var lastName = lastNameController.value.text;
    var phoneNumber = TextUtils()
        .stripFirstZeroAddCountryCode(number: phoneNumberController.value.text);
    var password = passwordController.value.text;
    var userAgreed = agreementCheck.value;
    var referralCode = inviteCodeController.value.text;

    isLoading(true);
    final userData = await authService.signup(UserSignUpModel(
      firstName: firstName,
      lastName: lastName,
      phone: phoneNumber,
      password: password,
      referralCode: referralCode,
      agreement: userAgreed,
    ));
    // userData.b
    userData.fold((l) {
      // isLoading(false);
      BotToast.showText(text: l.message);
    }, (r) {
      // navigateToVerify(k);
      // isLoading(false);
    });
  }

  navigateToVerify(Key? k) {
    Get.to(
      () => SignupVerificationMP(
        key: k,
        phoneNumber: phoneNumberController.text,
      ),
    );
  }
}
