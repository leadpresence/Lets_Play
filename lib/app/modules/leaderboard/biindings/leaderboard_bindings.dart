import 'package:get/get.dart';
import '../../leaderboard/controllers/leaderbooard_controller.dart';



class LeaderBoarBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeaderBoardController>(() => LeaderBoardController());
  }
}
