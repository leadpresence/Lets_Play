import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/signup/controllers/sign_up_controller.dart';


class SignUpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}
