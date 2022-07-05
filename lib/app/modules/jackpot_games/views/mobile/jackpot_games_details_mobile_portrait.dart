import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jekawin_mobile_flutter/app/modules/jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';
import '../../../../widgets/custom_large_button.dart';
import '../../../wallet_home/controllers/wallet_home_controller.dart';
import '../../controllers/jackpot_games_controller.dart';
import 'jackpot_games_success_screen.dart';

class JackpotGamesDetailsMobilePortrait extends StatelessWidget {
  final WalletHomeController walletController = Get.put(WalletHomeController());
  final String ticketNumber, numberOfGames, gameCost;
  final String gameId;
  final gameIndex;
  JackpotGamesDetailsMobilePortrait({
    Key? key,
    required this.ticketNumber,
    required this.numberOfGames,
    required this.gameCost,
    required this.gameId,
    this.gameIndex,
  }) : super(key: key);

  final JackpotGamesController controller = Get.put(JackpotGamesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            splashRadius: 25,
            icon: SvgPicture.asset(
              'assets/svgs/chevronLeft.svg',
              color: const Color(0xff12121D),
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Jackpot Games',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xff414249),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              padding: const EdgeInsets.all(24.0),
              width: Get.width,
              decoration: BoxDecoration(
                color: const Color(0XFFFFF7EC),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Number of games:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0XFF414249),
                          fontSize: 16,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        numberOfGames,
                        style: GoogleFonts.mulish(
                          color: const Color(0xffFE7A01),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Selected:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0XFF414249),
                          fontSize: 16,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        ticketNumber,
                        style: GoogleFonts.mulish(
                          color: const Color(0xffFE7A01),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      const Text(
                        'Cost of Game:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0XFF414249),
                          fontSize: 16,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        '₦$gameCost',
                        style: GoogleFonts.mulish(
                          color: const Color(0xffFE7A01),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 12.0,
              ),
              child: CustomButton(
                buttonText: "Pay with Wallet",
                buttonColor: Colors.white,
                buttonTextColor: const Color(0xffFE7A01),
                borderColor: const Color(0xffFE7A01),
                hasBorder: true,
                onPressed: () {
                  walletController.balance.value == 0
                      ? BotToast.showText(text: "Insufficient amount on wallet")
                      : showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0.0,
                              backgroundColor: Colors.transparent,
                              child: ConstrainedBox(
                                constraints:
                                    BoxConstraints(maxWidth: Get.width),
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
                                    mainAxisSize: MainAxisSize
                                        .min, // To make the card compact
                                    children: [
                                      const SizedBox(height: 4.0),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 16.0,
                                          right: 16.0,
                                          top: 16.0,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
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
                                      const Divider(
                                        thickness: .2,
                                        color: Colors.black87,
                                        // height: 1,
                                      ),
                                      Text(
                                          'You\'ll be deducted ₦$gameCost for this operation'),
                                      TextButton(
                                        onPressed: () {
                                          controller.stakeOnAGame(
                                            gameId,
                                            gameIndex: gameIndex,
                                          );
                                        },
                                        child: const Text('Continue'),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
