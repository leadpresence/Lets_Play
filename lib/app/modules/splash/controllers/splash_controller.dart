import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/config/routes/app_pages.dart';

import '../../auth/views/mobile/auth_home_mobile_potrait.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.to(
        () => const AuthHomeMobilePortrait(),
        transition: Transition.fade,
      ),
    );
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
}
