import 'package:get/get.dart';

import '../views/controllers/update_password_controller.dart';



class ResetPasswordBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdatePasswordController>(() => UpdatePasswordController());
  }
}
