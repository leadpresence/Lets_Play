import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/jackpot_games/views/widgets/time_left.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_large_button.dart';

import '../../../dashboard/controllers/dashboard_controller.dart';

class JackpotGamesSuccessMobileView extends StatelessWidget {
  final String msg;
  final Widget className;
  JackpotGamesSuccessMobileView({
    Key? key,
    this.msg = 'Success',
    required this.className,
  }) : super(key: key);

  final DashboardController dashboardController =
      Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svgs/success_check.svg'),
            const SizedBox(
              height: 24,
            ),
            Text(
              msg,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF4E4B66),
              ),
            ),
            TimeLeft(
              onPressed: () {},
              animation: StepTween(
                begin: dashboardController.timeRemainingInSec.value,
                end: 0,
              ).animate(
                dashboardController.animationController.value,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
              ),
              child: CustomButton(
                onPressed: () => Get.offAll(
                  () => className,
                  transition: Transition.cupertino,
                ),
                buttonText: 'Done',
              ),
            )
          ],
        ),
      ),
    );
  }
}
