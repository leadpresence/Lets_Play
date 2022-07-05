import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/login/views/login.dart';
import 'package:jekawin_mobile_flutter/app/modules/login/views/mobile/login_mobile_portrait.dart';
import 'package:jekawin_mobile_flutter/app/modules/signup/views/mobile/sign_up_mobile_potrait.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_small_button.dart';
import '../../../../config/data/local/user_local_impl.dart';
import '../../../dashboard/components/dashboard_components/dashboard_hero.dart';
import '../../../dashboard/components/dashboard_components/dashboard_instant_games.dart';
import '../../../dashboard/controllers/dashboard_controller.dart';
import '../../../signup/controllers/sign_up_controller.dart';

class GuestDashboardMobilePortrait extends StatelessWidget {
  GuestDashboardMobilePortrait({
    Key? key,
  }) : super(key: key);

  final SignUpController signUpController = Get.put(SignUpController());
  final DashboardController dashboardController =
      Get.put(DashboardController());
  final UserLocalDataSourceImpl user = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24.0,
                    right: 24.0,
                    // top: 24.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/svgs/user_icon.svg'),
                          const SizedBox(
                            width: 6,
                          ),
                          const Text(
                            "Guest User",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomSmallButton(
                            onPressed: () =>
                                Get.to(() => SignupMobilePortrait()),
                            buttonText: 'Sign up',
                            buttonColor: const Color(0xFFFE7A01),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          CustomSmallButton(
                            onPressed: () =>
                                Get.to(() => LoginMobilePortrait()),
                            buttonColor: Colors.white,
                            hasBorder: true,
                            buttonText: 'Login',
                            buttonTextColor: const Color(0xFFFE7A01),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  height: 360,
                  width: Get.width,
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        dashboardController.timeRemainingInSecsForGames.length,
                    controller: dashboardController.pageController,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Obx(
                        () => DashboardHeroSession(
                          onPressed: () {
                            Get.to(
                              () => const LoginView(),
                              transition: Transition.cupertino,
                            );
                          },
                          priceToBeWon: dashboardController
                              .indexList![index].gameId.price,
                          title: dashboardController
                              .indexList![index].gameId.title,
                          animation: StepTween(
                            begin: dashboardController
                                .timeRemainingInSecsForGames[index],
                            end: 0,
                          ).animate(
                            dashboardController
                                .gamesAnimationControllers[index].value,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                const DashboardInstantGames(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
