import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/notification/controllers/notification_controller.dart';


class NotificationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(() => NotificationController());
  }
}
