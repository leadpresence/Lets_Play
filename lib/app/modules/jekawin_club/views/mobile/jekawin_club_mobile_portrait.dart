import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/jekawin_club/views/mobile/widgets/insufficient_reward_points_sorry.dart';

class JekawinClubMobilePortrait extends StatelessWidget {
  const JekawinClubMobilePortrait({Key? key}) : super(key: key);

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
            splashRadius: 24,
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
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(
                  () => const InsufficientRewardPoints(),
                  transition: Transition.cupertino,
                );
              },
              child: Image.asset(
                'assets/images/gold_club.png',
                // color: const Color(0xff12121D),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                  () => const InsufficientRewardPoints(),
                  transition: Transition.cupertino,
                );
              },
              child: Image.asset(
                'assets/images/silver_club.png',
                // color: const Color(0xff12121D),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                  () => const InsufficientRewardPoints(),
                  transition: Transition.cupertino,
                );
              },
              child: Image.asset(
                'assets/images/bronze_club.png',
                // color: const Color(0xff12121D),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
