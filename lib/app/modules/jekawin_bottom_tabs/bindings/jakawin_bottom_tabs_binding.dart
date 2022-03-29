import 'package:get/get.dart';
import '../controllers/jakawin_bottom_tabs_controller.dart';

class JekawinBottomTabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JekawinBottomTabsController>(() => JekawinBottomTabsController());
  }
}
