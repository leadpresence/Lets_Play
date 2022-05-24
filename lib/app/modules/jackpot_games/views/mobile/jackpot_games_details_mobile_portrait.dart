import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jekawin_mobile_flutter/app/modules/jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';
import '../../../../widgets/custom_large_button.dart';
import '../../controllers/jackpot_games_controller.dart';
import 'jackpot_games_success_screen.dart';

class JackpotGamesDetailsMobilePortrait extends StatelessWidget {
  final String ticketNumber, numberOfGames, gameCost;
  JackpotGamesDetailsMobilePortrait({
    Key? key,
    required this.ticketNumber,
    required this.numberOfGames,
    required this.gameCost,
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
                        'Selected Numbers:',
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
                  Get.to(
                    () => JackpotGamesSuccessMobileView(
                      className: const JekawinBottomTabs(
                        tabIndex: 0,
                      ),
                      msg: 'Ticket purchased Successfully',
                    ),
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
