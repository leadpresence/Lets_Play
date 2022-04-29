import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/signup_verification/views/verifiication_success_or_failure_mobile_view.dart';

import '../../../../config/services/auth_service.dart';
import '../../../e_shop/views/mobile/success_or_failure_mobile_view.dart';
import '../../../login/views/login.dart';

class UpdatePasswordController extends GetxController {
  final AuthServiceImpl authService = Get.find<AuthServiceImpl>();
  final newPasswordController = TextEditingController();

  RxString errorNewPasswordMessage = "".obs;
  var isLoading = false.obs;

  void clearErrorNewPassword() => errorNewPasswordMessage.value = '';

  updatePasswordFormValidator(Key? k) {
    if ((GetUtils.isBlank(newPasswordController.text)) == true) {
      return errorNewPasswordMessage.value =
          "      Password field cannot be blank.";
    } else {
      updatePassword(k);
    }
  }

  Future<void> updatePassword(Key? k) async {
    isLoading = true.obs;
    final response =
        await authService.updatePassword(newPasswordController.text);
    response.fold((l) {
      BotToast.showText(text: l.message);
      isLoading = false.obs;
    }, (r) {
      BotToast.showText(text:"Password reset successful");
      navigateToLoginView(k);
      isLoading = false.obs;
    });
  }

  void navigateToLoginView(Key? k) {
    Get.to(() => const LoginView());
  }
}
