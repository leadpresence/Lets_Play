import 'package:get/get.dart';

import '../controllers/otp_reset_password_controller.dart';


class OtpResetPasswordBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpResetPasswordController>(() => OtpResetPasswordController());
  }
}
