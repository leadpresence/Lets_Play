import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/true_or_false/views/mobile/start_true_false_game_mobile_portrait.dart';
import '../../../../widgets/custom_large_button.dart';

class TrueOrFalseMobilePortrait extends StatelessWidget {
  const TrueOrFalseMobilePortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                child: Image.asset(
                  'assets/svgs/true_false_background.png',
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 50),
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                bottom: 96.0,
              ),
              child: CustomButton(
                buttonText: "Start Game",
                onPressed: () {
                  Get.to(() => StartTrueFalseGameMobilePortrait());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
