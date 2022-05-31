import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jekawin_mobile_flutter/app/modules/pin/controllers/set_pin_controllers.dart';

class SetPinBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetPinController>(() => SetPinController());
  }
}