import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/controllers/e_shop_controller.dart';

class EShopBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EShopController>(() => EShopController());
  }
}
