import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jekawin_mobile_flutter/app/modules/edit_profile/views/mobile/edit_profile_mobile_porttrait.dart';
import '../../../config/services/auth_service.dart';
import '../../../config/services/di/di_locator.dart';
import '../../../widgets/custom_large_button.dart';
import '../../../widgets/fade_in_animations.dart';
import '../../e_shop/views/mobile/success_or_failure_mobile_view.dart';
import '../views/mobile/email_otp_verification.dart';

class EditProfileController extends GetxController {
  final AuthServiceImpl authService = Get.find<AuthServiceImpl>();
  final editFormKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();
  var emailTextController = TextEditingController();
  final emailOTPCode = TextEditingController();

  final FocusNode searchTextField = FocusNode();
  final utilsProvider = UtilsController();

  RxString avatarUrl = "".obs;
  RxString emailErrorMessage = "".obs;
  Rx<bool> isLoading = false.obs;

  @override
  void onInit() {
    avatarUrl.value = GetStorage().read('profileImage');
    searchTextField.requestFocus();
    emailTextController.text = utilsProvider.getEmail();
    emailTextController = TextEditingController(text: utilsProvider.getEmail());
    super.onInit();
  }

  void clearErrorEmail() => emailErrorMessage.value = '';

  editProfileFormValidator(Key? k) {
    if ((GetUtils.isBlank(emailTextController.text)) == true) {
      return emailErrorMessage.value = 'Email Address field cannot be blank';
    } else if (!GetUtils.isEmail(emailTextController.text)) {
      return emailErrorMessage.value = 'Invalid Email Address';
    } else {
      showAddEmailAlertDialog(k);
    }
  }

  showAddEmailAlertDialog(Key? k) {
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
                    const SizedBox(height: 40.0),
                    Obx(
                      () => SizedBox(
                        width: Get.width * .36,
                        child: Expanded(
                          child: CustomButton(
                            height: 40.0,
                            onPressed: () {
                              addEmail(k);
                            },
                            buttonText: 'Verify',
                            isLoading: isLoading.value,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
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

  Future<void> addEmail(Key? k) async {
    isLoading.value = true;
    var emailAddressText = emailTextController.text;
    await authService.addEmail(emailAddressText);
    navigateToVerifyOTP(k);
    isLoading.value = false;
  }

  navigateToVerifyOTP(Key? k) {
    Get.back();
    utilsProvider.setEmail(emailTextController.text);
    emailTextController.text = utilsProvider.getEmail();
    Get.to(
      () => EmailOTPVerification(
        email: emailTextController.text,
      ),
      transition: Transition.cupertino,
    );
    isLoading.value = false;
  }

  Future<void> verifyEmailOTP(Key? k) async {
    isLoading.value = true;
    await authService.verifyEmailOtp(emailOTPCode.text);
    navigateToDashboard(k);
    isLoading.value = false;
  }

  navigateToDashboard(Key? k) {
    Get.to(
      () => SuccessOrFailureMobileView(
        msg: 'Email Successfully Added',
        className: EditProfileMobilePortrait(),
      ),
      transition: Transition.cupertino,
    );

    isLoading.value = false;
  }
}
