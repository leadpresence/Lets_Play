import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:jekawin_mobile_flutter/app/modules/fund_wallet/controllers/fund_wallet_controller.dart';

class FundWalletBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<FundWalletController>(() => FundWalletController());
  }


}