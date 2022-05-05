import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jekawin_mobile_flutter/app/modules/login/views/login.dart';

import '../../../config/services/auth_service.dart';

class UserProfileController extends GetxController {
  final AuthServiceImpl authService = Get.find<AuthServiceImpl>();

  Future<void> signout(Key? k) async {
    final userData = await authService.signout();
    // userData.fold(
    //   (l) {
    //     BotToast.showText(text: l.message);
    //   },
    //   (r) {
    navigateToLoginScreen(k);
    // },
    // );
  }

  navigateToLoginScreen(Key? k) {
    Get.to(
      () => const LoginView(),
      transition: Transition.cupertino,
    );
  }
}
