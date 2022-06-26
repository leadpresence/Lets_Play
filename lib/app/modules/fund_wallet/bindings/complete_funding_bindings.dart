import 'package:get/get.dart';

import '../../wallet_home/controllers/wallet_home_controller.dart';

class CompleteFundingBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<WalletHomeController>(() => WalletHomeController());

  }

}
