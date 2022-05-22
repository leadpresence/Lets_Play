import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';


class LeaderBoardController extends GetxController {

  var showDaily = true.obs;
  var showWeekly = false.obs;
  var showMonthly = false.obs;

  var isLoading = false.obs;


  void toggleToday() {
    showDaily.value=true;
    if(showDaily.value){
      showWeekly.value = !showDaily.value;
      showMonthly.value = !showDaily.value;
    }
  }
  void toggleWeek() {
    showWeekly.value=true;
    if(showWeekly.value){
      showDaily.value = !showWeekly.value;
      showMonthly.value = !showWeekly.value;
    }
  }
  void toggleMonthly() {
    showMonthly.value=true;
    if(showMonthly.value){
      showDaily.value = !showMonthly.value;
      showWeekly.value = !showMonthly.value;
    }
  }

  @override
  void onInit() {
    showDaily.value=true;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void dispose() {}

  @override
  void onClose() {}

}
