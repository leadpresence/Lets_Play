
import 'package:get/get.dart';

import '../controllers/signup_verification_controller.dart';

class SignupVerificationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpVerificationController>(() => SignUpVerificationController());
  }
}
