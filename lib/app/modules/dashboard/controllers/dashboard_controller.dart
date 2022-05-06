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
  int days = 0, hours = 0, minutes = 0, seconds = 0;
  var timeRemainingInSec = 0;

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
    days = difference.inDays;
    hours = difference.inHours % 24;
    minutes = difference.inMinutes % 60;
    seconds = difference.inSeconds % 60;

    timeRemainingInSec =
        days * 86400 + hours * 3600 + minutes * 60 + seconds;
    animationController.value = AnimationController(
        vsync: this,
        duration: Duration(
          days: days,
          hours: hours,
          minutes: minutes,
          seconds: seconds,
        ));
    animationController.value.forward();
    update();
  }

  @override
  void onInit() {
    getGames();
    super.onInit();
  }
}
