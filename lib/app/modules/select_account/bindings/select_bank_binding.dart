import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:jekawin_mobile_flutter/app/modules/select_account/controller/select_bank_controller.dart';

class SelectBankBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SelectBankController>(() => SelectBankController());
  }


}