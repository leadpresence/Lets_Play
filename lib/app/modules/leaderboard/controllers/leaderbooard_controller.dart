import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/leaderboard/models/leader_board_response.dart';
import '../../../config/services/auth_service.dart';

class LeaderBoardController extends GetxController {
  final AuthServiceImpl authService = Get.find<AuthServiceImpl>();
  var showDaily = true.obs;
  var showWeekly = false.obs;
  var showMonthly = false.obs;
  var duration = "day".obs;

  void toggleToday() {
    duration.value = "day";
    getLeaderBoard("day");
    showDaily.value = true;
    if (showDaily.value) {
      showWeekly.value = !showDaily.value;
      showMonthly.value = !showDaily.value;
    }
  }

  void toggleWeek() {
    duration.value = "week";
    getLeaderBoard("week");
    showWeekly.value = true;
    if (showWeekly.value) {
      showDaily.value = !showWeekly.value;
      showMonthly.value = !showWeekly.value;
    }
  }

  void toggleMonthly() {
    duration.value = "month";
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
    // fans.bindStream(getFans());
  }

  @override
  void onReady() {
    super.onReady();
    // fans.bindStream(getFans());
  }

  Future<LeaderBoardResponse?> getLeaderBoard(String duration) async {
    var leaderboard = await authService.leaderBoard(duration);
    try {
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
