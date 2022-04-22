import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/add_bank_controller.dart';

class AddBankBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AddBankController>(() => AddBankController());
  }


}