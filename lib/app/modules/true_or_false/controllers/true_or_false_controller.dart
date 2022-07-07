import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/true_or_false/models/true_or_false_game_response_model.dart';

import '../../../config/services/games_service.dart';

class TrueOrFalseController extends GetxController
    with GetTickerProviderStateMixin {
  final GamesServiceImpl gamesService = Get.put(GamesServiceImpl());
  late Rx<int> currentPage;
  late AnimationController nextController;
  late PageController bgPageController;
  Rx<int> totalRewardPoints = 0.obs, itemIndex = 0.obs;

  var body;

  getTrueOrFalseGames() async {
    try {
      var response = await gamesService.getTrueOrFalseGames();
      if (response.statusCode == 200 || response.statusCode == 201) {
        body = TrueOrFalseResModel.fromJson(response.data);
        return body;
      } else {
        if (kDebugMode) {
          print(
              'Response.statusCode != 200: \n${TrueOrFalseResModel.fromJson(response.data).statusCode}');
          BotToast.showSimpleNotification(
            title: TrueOrFalseResModel.fromJson(response.data).toString(),
          );
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

  void nextPage() async {
    moveToNextPage(lastPage: body!.body.items.length - 1);
    await animateMovingToNextPage();
    slideBackgroundTo(currentPage.value);
  }

  void slideBackgroundTo(int currentPage) {
    bgPageController.animateToPage(
      currentPage,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 470),
    );
  }

  void moveToNextPage({required int lastPage}) async {
    if (currentPage.value == lastPage) {
      // await Future.delayed(Duration(milliseconds: 150));
      // Get.offNamed(Routes.WELCOME);
    } else {
      currentPage.value++;
    }
  }

  Future<void> animateMovingToNextPage() async {
    nextController.reverse(from: nextController.upperBound);
    await Future.delayed(const Duration(milliseconds: 200));
    nextController.forward(from: nextController.lowerBound);
  }

  @override
  void onInit() {
    currentPage = 0.obs;
    nextController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
      reverseDuration: const Duration(milliseconds: 400),
    );
    bgPageController = PageController();
    super.onInit();
  }

  @override
  void dispose() {
    nextController.dispose();
    bgPageController.dispose();
    super.dispose();
  }
}
