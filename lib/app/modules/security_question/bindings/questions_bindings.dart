import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controller/questions_controller.dart';

class QuestionsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionsController>(() => QuestionsController());
  }
}