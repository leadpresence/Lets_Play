import 'package:get/get.dart';

import '../../resetpassword/controllers/reset_password_controller.dart';


class ResetPasswordBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordController>(() => ResetPasswordController());
  }
}
