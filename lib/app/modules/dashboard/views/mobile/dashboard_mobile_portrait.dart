import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jekawin_mobile_flutter/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/notification/views/mobile/notifications_mobile_portrait.dart';
import '../../../../config/data/local/user_local_impl.dart';
import '../../../jackpot_games/views/mobile/jackpot_games_mobile_portrait.dart';
import '../../../signup/controllers/sign_up_controller.dart';
import '../../../user_profile/views/mobile/user_profile_mobile_portrait.dart';
import '../../components/dashboard_components/dashboard_hero.dart';
import '../../components/dashboard_components/dashboard_instant_games.dart';

class DashboardMobilePortrait extends StatelessWidget {
  DashboardMobilePortrait({
    Key? key,
  }) : super(key: key);

  final SignUpController signUpController = Get.put(SignUpController());
  final DashboardController dashboardController =
      Get.put(DashboardController());
  final UserLocalDataSourceImpl user = Get.find();

  @override
  Widget build(BuildContext context) {
    var firstName = GetStorage().read("firstName");
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
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => UserProfileMobilePortrait(),
                            transition: Transition.cupertino,
                          );
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/svgs/user_icon.svg'),
                            const SizedBox(
                              width: 6,
                            ),
                            Text("Hi $firstName"),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => NotificationMobilePortrait(),
                            transition: Transition.cupertino,
                          );
                        },
                        child: SvgPicture.asset(
                          'assets/svgs/clarity_notification-outline-badged.svg',
                        ),
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
                              () => JackpotGamesMobilePortrait(
                                gameIndex: index,
                                gameID: dashboardController
                                    .indexList![index].gameId.id,
                              ),
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
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
