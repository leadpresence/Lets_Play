import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:jekawin_mobile_flutter/app/modules/withdrawal_amount/controllers/withdrawal_amount_controller.dart';

import '../controllers/withrawal_confirmation_controllers.dart';

class WithdrawalConfirmationBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<WithdrawalConfirmationController>(() => WithdrawalConfirmationController());
  }


}