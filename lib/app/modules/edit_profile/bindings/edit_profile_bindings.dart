import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controllers/edit_profile_controllers.dart';

class EditProfileBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(() => EditProfileController());
  }


}