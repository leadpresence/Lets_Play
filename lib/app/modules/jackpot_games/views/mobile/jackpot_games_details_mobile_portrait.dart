import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../controllers/jackpot_games_controller.dart';

class JackpotGamesDetailsMobilePortrait extends StatelessWidget {
  JackpotGamesDetailsMobilePortrait({Key? key}) : super(key: key);

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
                children: const [
                  Text(
                    'Number of games:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0XFF414249),
                      fontSize: 16,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Selected Numbers:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0XFF414249),
                      fontSize: 16,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Cost of Game:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0XFF414249),
                      fontSize: 16,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
