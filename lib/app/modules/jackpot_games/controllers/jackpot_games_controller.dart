import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../config/services/games_service.dart';
import '../../jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';
import '../views/mobile/jackpot_games_success_screen.dart';

class JackpotGamesController extends GetxController {
  final TextEditingController pin1 = TextEditingController(),
      pin2 = TextEditingController(),
      pin3 = TextEditingController(),
      pin4 = TextEditingController(),
      pin5 = TextEditingController();

  Rx<bool> isLoading = false.obs;

  final GamesServiceImpl gamesService = Get.put(GamesServiceImpl());

  void stakeOnAGame(gameID, {gameIndex}) async {
    isLoading.value = true;
    var body = {
      "email": "felixpresence@gmail.com",
      "amount": 50,
      "duration": 1,
      "tickets": [
        [
          int.parse(pin1.text),
          int.parse(pin2.text),
          int.parse(pin3.text),
          int.parse(pin4.text),
          int.parse(pin5.text)
        ]
      ],
      "single": true
    };

    print("this is body: \n $body");
    try {
      var res = await gamesService.stackOnAGame(body: body, gameID: gameID);
      isLoading.value = false;
      if (res.statusCode == 200 || res.statusCode == 201) {
        // loginUserResponse = LoginUserResponse.fromJson(res.data);
        // LocalStorage.saveToken(loginUserResponse!.accessToken);
        isLoading.value = false;
        Get.to(
          () => JackpotGamesSuccessMobileView(
            gameIndex: gameIndex,
            className: const JekawinBottomTabs(
              tabIndex: 0,
            ),
            msg: 'Ticket purchased Successfully',
          ),
        );
      } else {
        if (kDebugMode) {
          print('Response.statusCode != 200: \n${res.data['message']}');
        }
      }
    } catch (e) {
      isLoading.value = false;
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
