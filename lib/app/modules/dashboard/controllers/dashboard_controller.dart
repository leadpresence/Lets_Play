import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/config/services/games_service.dart';
import '../models/jackpot_game_model.dart';
import '../models/unread_notifications_response_model.dart';

class DashboardController extends GetxController
    with SingleGetTickerProviderMixin {
  PageController pageController = PageController(initialPage: 0);
  final GamesServiceImpl gamesService = Get.put(GamesServiceImpl());

  Rx<bool> unSeenNotification = false.obs;

  late List<Body>? indexList = <Body>[];
  late List<Duration>? gamesDurations = <Duration>[];
  late List<DateTime>? endDates = <DateTime>[];
  var _timer, body;
  int _currentPage = 0, totalGamesLength = 0;

  late List<Rx<AnimationController>> gamesAnimationControllers = [];
  RxInt days = 0.obs, hours = 0.obs, minutes = 0.obs, seconds = 0.obs;
  RxList<int> timeRemainingInSecsForGames = <int>[].obs;
  UnreadNotificationsResponseModel? unreadNotificationsResponseData;

  getAllJackpotGames() async {
    timeRemainingInSecsForGames.clear();
    gamesAnimationControllers.clear();
    try {
      var response = await gamesService.getAllJackpotGames();
      if (response.statusCode == 200 || response.statusCode == 201) {
        body = response.data;
        totalGamesLength =
            JackpotGameResponse.fromJson(response.data).body.length;
        for (int i = 0;
            i < JackpotGameResponse.fromJson(response.data).body.length;
            i++) {
          if (kDebugMode) {
            print(
                "This are the values : ${JackpotGameResponse.fromJson(response.data).body.length}");
          }
          indexList!.add(JackpotGameResponse.fromJson(response.data).body[i]);
          endDates!
              .add(JackpotGameResponse.fromJson(response.data).body[i].endDate);
          _timer;
        }
        startCountDown();
        return body;
      } else {
        if (kDebugMode) {
          print(
              'Response.statusCode != 200: \n${JackpotGameResponse.fromJson(response.data).message}');
          // BotToast.showSimpleNotification(
          //   title: JackpotGameResponse.fromJson(response.data)
          //       .message
          //       .toString()
          //       .trim(),
          // );
        }
        return body;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return body;
  }

  DateTime dateFormat(DateTime dateValue) {
    DateTime dt = DateTime.parse(dateValue.toString().substring(0, 10) +
        ' ' +
        dateValue.toString().substring(11, 23));
    return dt;
  }

  void startCountDown() {
    timeRemainingInSecsForGames.clear();
    gamesAnimationControllers.clear();

    for (int i = 0; i < endDates!.length; i++) {
      final Duration difference = endDates![i].difference(DateTime.now());
      days.value = difference.inDays;
      hours.value = difference.inHours % 24;
      minutes.value = difference.inMinutes % 60;
      seconds.value = difference.inSeconds % 60;

      timeRemainingInSecsForGames.add(
        days.value * 86400 +
            hours.value * 3600 +
            minutes.value * 60 +
            seconds.value,
      );

      gamesAnimationControllers.add(
        AnimationController(
          vsync: this,
          duration: Duration(
            days: days.value,
            hours: hours.value,
            minutes: minutes.value,
            seconds: seconds.value,
          ),
        ).obs,
      );

      gamesAnimationControllers[i].value.forward();
      update();
    }
  }

  Future<UnreadNotificationsResponseModel?> unreadNotifications(Key? k) async {
    try {
      final res = await gamesService.unreadNotifications();
      if (res.statusCode == 200 || res.statusCode == 201) {
        unreadNotificationsResponseData =
            UnreadNotificationsResponseModel.fromJson(res.data);
        return unreadNotificationsResponseData;
      }
    } catch (e) {
      BotToast.showText(
        text: "An error occurred. Please try again. $e",
      );
    }
    return null;
  }

  @override
  void onInit() {
    indexList;
    _currentPage = 0;
    totalGamesLength = 0;
    endDates;
    timeRemainingInSecsForGames;
    gamesDurations;
    // getAllJackpotGames();
    _timer = Timer.periodic(
      const Duration(seconds: 10),
      (Timer timer) {
        if (_currentPage < totalGamesLength - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        if (pageController.hasClients) {
          pageController.animateToPage(
            _currentPage,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOutQuart,
          );
        }
      },
    );
    super.onInit();
  }
}
