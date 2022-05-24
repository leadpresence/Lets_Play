import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/config/services/games_service.dart';
import '../models/jackpot_game_model.dart';

class DashboardController extends GetxController
    with SingleGetTickerProviderMixin {
  final GamesServiceImpl gamesService = Get.put(GamesServiceImpl());
  late JackpotGameModel res;
  late DateTime startDate, endDate;
  late Rx<AnimationController> animationController =
      AnimationController(vsync: this).obs;
  RxInt days = 0.obs, hours = 0.obs, minutes = 0.obs, seconds = 0.obs;
  RxInt timeRemainingInSec = 0.obs;

  Future<JackpotGameModel> getGames() async {
    await gamesService.getJackPotGame();
    res = gamesService.jackpotGameRetrievedRes;
    startDate = dateFormat(res.body.startDate);
    endDate = dateFormat(res.body.endDate);
    startCountDown();
    return res;
  }

  // DateFormat("EEE, d MMM yyyy HH:mm:ss").format(dt)

  DateTime dateFormat(DateTime dateValue) {
    DateTime dt = DateTime.parse(dateValue.toString().substring(0, 10) +
        ' ' +
        dateValue.toString().substring(11, 23));
    return dt;
  }

  void startCountDown() {
    final difference = endDate.difference(DateTime.now());
    days.value = difference.inDays;
    hours.value = difference.inHours % 24;
    minutes.value = difference.inMinutes % 60;
    seconds.value = difference.inSeconds % 60;

    timeRemainingInSec.value = days.value * 86400 +
        hours.value * 3600 +
        minutes.value * 60 +
        seconds.value;

    animationController.value = AnimationController(
        vsync: this,
        duration: Duration(
          days: days.value,
          hours: hours.value,
          minutes: minutes.value,
          seconds: seconds.value,
        ));
    animationController.value.forward();
    update();
  }

  @override
  void dispose() {
    animationController.value.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    getGames();
    super.onInit();
  }
}
