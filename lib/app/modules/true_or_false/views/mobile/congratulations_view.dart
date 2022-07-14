import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jekawin_mobile_flutter/app/modules/jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';
import 'package:jekawin_mobile_flutter/app/modules/true_or_false/controllers/true_or_false_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/true_or_false/views/true_or_false_view.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_large_button.dart';

class CongratulationsView extends StatelessWidget {
  CongratulationsView({Key? key, required this.totalPoints}) : super(key: key);
  final int totalPoints;
  final TrueOrFalseController controller = Get.put(TrueOrFalseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24.0),
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/jpgs/bubble_.png'),
            const SizedBox(
              height: 24,
            ),
            // Image.asset('assets/jpgs/CONGRATULATIONS.png'),
            Text(
              'CONGRATULATIONS',
              style: GoogleFonts.lemon(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "You earned $totalPoints reward points",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: () {
                      Get.to(
                        () => const TrueOrFalseView(),
                        transition: Transition.cupertino,
                      );
                    },
                    buttonText: 'Play Again',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomButton(
                    hasBorder: true,
                    borderColor: const Color(0xffFE7A01),
                    buttonColor: Colors.white,
                    buttonTextColor: const Color(0xffFE7A01),
                    onPressed: () {
                      Get.to(
                        () => JekawinBottomTabs(
                          tabIndex: 0,
                        ),
                        transition: Transition.cupertino,
                      );
                    },
                    buttonText: 'End Game',
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TryAgainView extends StatelessWidget {
  TryAgainView({Key? key, required this.totalPoints}) : super(key: key);
  final int totalPoints;
  final TrueOrFalseController controller = Get.put(TrueOrFalseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24.0),
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/jpgs/sad_face.png'),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Oops',
              style: GoogleFonts.lemon(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
           const Text(
              "You earned no reward points.",
              style:  TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: () {
                      Get.to(
                            () => const TrueOrFalseView(),
                        transition: Transition.cupertino,
                      );
                    },
                    buttonText: 'Play Again',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomButton(
                    hasBorder: true,
                    borderColor: const Color(0xffFE7A01),
                    buttonColor: Colors.white,
                    buttonTextColor: const Color(0xffFE7A01),
                    onPressed: () {
                      Get.to(
                            () => JekawinBottomTabs(
                          tabIndex: 0,
                        ),
                        transition: Transition.cupertino,
                      );
                    },
                    buttonText: 'End Game',
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
