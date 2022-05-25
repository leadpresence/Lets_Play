import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/notification/controllers/notification_controller.dart';

import '../controller/my_games_controller.dart';


class MyGamesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyGamesController>(() => MyGamesController());
  }
}
