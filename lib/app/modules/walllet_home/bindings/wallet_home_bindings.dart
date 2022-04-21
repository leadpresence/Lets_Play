import 'package:get/get.dart';

import '../controllers/wallet_home_controller.dart';

class WalletHomeBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<WalletHomeController>(() => WalletHomeController());

  }

}
