import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/widgets/fade_in_animations.dart';

import '../../../config/services/games_service.dart';
import '../../../widgets/custom_large_button.dart';
import '../../fund_wallet/views/fund_wallet_view.dart';
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

  void stakeOnAGame(gameID, {gameIndex, gameCost}) async {
    isLoading.value = true;
    var body = {
      "email": "felixpresence@gmail.com",
      "amount": gameCost,
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
        print("Hi +++++++ ${res.data.toString()}");
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
        if (res.statusCode == 400) {
          Get.back();
          showDialog(
            context: Get.context!,
            builder: (BuildContext context) {
              return FadeIn(
                duration: const Duration(milliseconds: 200),
                delay: const Duration(milliseconds: 100),
                child: Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0.0,
                  backgroundColor: Colors.transparent,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: Get.width),
                    child: Container(
                      margin: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 24.0,
                            offset: Offset(0.0, 10.0),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize:
                            MainAxisSize.min, // To make the card compact
                        children: [
                          const SizedBox(height: 4.0),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                              top: 16.0,
                              bottom: 16.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(),
                                InkWell(
                                  onTap: () => Get.back(),
                                  child: SvgPicture.asset(
                                    'assets/svgs/cancel.svg',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          const Text(
                            'Insufficient amount in wallet\nFund wallet to continue.',
                            style: TextStyle(height: 1.6),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24.0),
                          SizedBox(
                            width: Get.width * .36,
                            child: Expanded(
                              child: CustomButton(
                                height: 40.0,
                                onPressed: () {
                                  Get.back();
                                  Get.to(
                                    () => const FundWalletView(),
                                    transition: Transition.downToUp,
                                  );
                                },
                                buttonText: 'Fund Wallet',
                                buttonColor: Colors.white,
                                buttonTextColor: const Color(0xffFE7A01),
                                borderColor: const Color(0xffFE7A01),
                                hasBorder: true,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );

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
