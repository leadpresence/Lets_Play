import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:get_storage/get_storage.dart';

import '../../../widgets/custom_large_button.dart';
import '../../../widgets/fade_in_animations.dart';
import '../views/mobile/email_otp_verification.dart';

class EditProfileController extends GetxController {
  final editFormKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();
  final emailTextController = TextEditingController();

  RxString avatarUrl = "".obs;
  RxString emailErrorMessage = "".obs;

  @override
  void onInit() {
    avatarUrl.value = GetStorage().read('profileImage');
    super.onInit();
  }

  void clearErrorEmail() => emailErrorMessage.value = '';

  editProfileFormValidator() {
    if ((GetUtils.isBlank(emailTextController.text)) == true) {
      return emailErrorMessage.value = 'Email Address field cannot be blank';
    } else if (!GetUtils.isEmail(emailTextController.text)) {
      return emailErrorMessage.value = 'Invalid Email Address';
    } else {
      alertDialog();
    }
  }

  alertDialog() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return FadeIn(
          duration: const Duration(milliseconds: 200),
          delay: const Duration(milliseconds: 100),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: Get.width),
              child: Container(
                margin: EdgeInsets.zero,
                padding: const EdgeInsets.only(bottom: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 24.0,
                      offset: Offset(0.0, 10.0),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // To make the card compact
                  children: [
                    const SizedBox(height: 4.0),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                        top: 24.0,
                        bottom: 24.0,
                      ),
                      child: Text(
                        'Verify Your Email',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Please confirm that you want to use this email for your jekawin account',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff000000),
                              height: 1.6,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    SizedBox(
                      width: Get.width * .36,
                      child: Expanded(
                        child: CustomButton(
                          height: 40.0,
                          onPressed: () {
                            Get.back();
                            Get.to(
                              () => EmailOTPVerification(
                                email: emailTextController.text,
                              ),
                              transition: Transition.cupertino,
                            );
                          },
                          buttonText: 'Verify',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
