import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jekawin_mobile_flutter/app/modules/leaderboard/models/leader_board_response.dart';

import '../../../config/services/auth_service.dart';

class LeaderBoardController extends GetxController {
  final AuthServiceImpl authService = Get.find<AuthServiceImpl>();

  var showDaily = true.obs;
  var showWeekly = false.obs;
  var showMonthly = false.obs;
  var duration = "day".obs;
  // Rx<List<ScoreItem>> playerScoreItem = [].obs as Rx<List<ScoreItem>>;
  // Rx<LeaderBoardResponse> leaderBoardScores = Rx<LeaderBoardResponse>(LeaderBoardResponse(data: [],success: false,message: "",statusCode: 400));

  var isLoading = false.obs;

  void toggleToday() {
    duration.value="day";
    getLeaderBoard("day");
    showDaily.value = true;
    if (showDaily.value) {
      showWeekly.value = !showDaily.value;
      showMonthly.value = !showDaily.value;
    }
  }

  void toggleWeek() {
    duration.value="week";
    getLeaderBoard("week");
    showWeekly.value = true;
    if (showWeekly.value) {
      showDaily.value = !showWeekly.value;
      showMonthly.value = !showWeekly.value;
    }
  }

  void toggleMonthly() {
    duration.value="month";
    getLeaderBoard("month");
    showMonthly.value = true;
    if (showMonthly.value) {
      showDaily.value = !showMonthly.value;
      showWeekly.value = !showMonthly.value;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getLeaderBoard("day");
    showDaily.value = true;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  Future<LeaderBoardResponse?> getLeaderBoard(String duration) async {
    var leaderboard = await authService.leaderBoard(duration);
    try {
      // playerScoreItem.value =leaderboard.data;
      // leaderBoardScores.value =leaderboard;
      return leaderboard;
    } catch (e) {
      print("Error retrieving Items for leaderboard");
    }
    return null;
  }

  @override
  void dispose() {}

  @override
  void onClose() {}
}
