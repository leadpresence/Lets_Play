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
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> updatePassword(Key? k) async {
    final response =
        await authService.updatePassword(newPasswordController.text);
    response.fold((l) {
      BotToast.showText(text: l.message);
    }, (r) {
      BotToast.showText(text:"Password reset successful");
      navigateToLoginView(k);
    });
  }

  void navigateToLoginView(Key? k) {
    Get.to(() => const LoginView());
  }
}
