import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/leaderboard/models/leader_board_response.dart';
import '../../../config/services/auth_service.dart';

import '../../../config/services/di/di_locator.dart';
import '../../../utils/helpers/text_helper.dart';
import '../models/FansMdel.dart';

class LeaderBoardController extends GetxController {
  final AuthServiceImpl authService = Get.find<AuthServiceImpl>();

  RxList<FanxtarsModel> fans = RxList<FanxtarsModel>([]);
  final favFormKey = GlobalKey<FormState>();

  final fName = TextEditingController();
  final fAge = TextEditingController();
  final fCity = TextEditingController();
  final fFavorite = TextEditingController();
  final fDateJoined = TextEditingController();
  final fPhone = TextEditingController();
  RxString errorName = "".obs;
  RxString errorAge = "".obs;
  RxString errorFavorite = "".obs;
  RxString errorCity = "".obs;
  RxString errorDateJoined = "".obs;
  RxString errorPhone = "".obs;
  var isLoading = false.obs;

  void clearErrorName() => errorAge.value = '';

  void clearErrorPassword() => errorName.value = '';

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
    fans.bindStream(getFans());
  }

  @override
  void onReady() {
    super.onReady();
    fans.bindStream(getFans());
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

  Stream<List<FanxtarsModel>> getFans() {
    var result = firebaseFirestore.collection(collectionPath).snapshots().map(
        (query) => query.docs
            .map((fans) => FanxtarsModel.fromMap(fans.data()))
            .toList());
    return result;
  }

  favFormValidator(Key? k) {
    if ((GetUtils.isBlank(fName.text)) == true) {
      return errorName.value = '      Name field cannot be blank.';
    } else if ((GetUtils.isBlank(fFavorite.text)) == true) {
      errorAge.value = '      Tell use you favorite game played.';
    } else if ((GetUtils.isBlank(fAge.text)) == true) {
      errorAge.value = '      Age field cannot be blank.';
    } else if ((GetUtils.isBlank(fCity.text)) == true) {
      errorAge.value = '      City field cannot be blank.';
    } else if ((GetUtils.isBlank(fDateJoined.text)) == true) {
      errorAge.value = '      When did u likely join?.';
    } else if ((GetUtils.isBlank(fPhone.text)) == true) {
      errorAge.value = '      Phone field cannot be blank.';
    } else if (!fPhone.text.startsWith('0')) {
      errorPhone.value = "      Phone number must start with zero";
    } else if (fPhone.text.length != 11) {
      errorPhone.value = "      Phone number must be 11 digits";
    } else {
      addFavorites();
    }
  }

  addFavorites() {
    isLoading.value = true;
    var name = fName.text.toString();
    var phone = TextUtils()
        .stripFirstZeroAddCountryCode(number: fPhone.text.toString());
    var age = fAge.text.toString();
    var favorite = fFavorite.text.toString();
    var city = fCity.text.toString();
    var dateJoined = fDateJoined.text.toString();
    firebaseFirestore
        .collection(collectionPath)
        .add(FanxtarsModel(
                name: name,
                phone: phone,
                age: age,
                favorite: favorite,
                city: city,
                dateJoined: dateJoined)
            .toMap())
        .then((value) {
      print("User Added");
    }).catchError((error) => print("Failed to add favorites: $error"));
    ;

    isLoading.value = false;
  }
}
