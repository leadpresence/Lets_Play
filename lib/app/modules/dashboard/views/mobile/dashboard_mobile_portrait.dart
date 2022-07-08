import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jekawin_mobile_flutter/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/notification/views/mobile/notifications_mobile_portrait.dart';
import '../../../../config/data/local/user_local_impl.dart';
import '../../../../widgets/custom_medium_button.dart';
import '../../../edit_profile/views/mobile/edit_profile_mobile_porttrait.dart';
import '../../../fund_wallet/views/fund_wallet_view.dart';
import '../../../jackpot_games/views/mobile/jackpot_games_mobile_portrait.dart';
import '../../../select_account/views/select_bank_view.dart';
import '../../../signup/controllers/sign_up_controller.dart';
import '../../../true_or_false/views/true_or_false_view.dart';
import '../../../user_profile/views/mobile/user_profile_mobile_portrait.dart';
import '../../../wallet_home/controllers/wallet_home_controller.dart';
import '../../components/dashboard_components/dashboard_hero.dart';
import '../../components/dashboard_components/dashboard_instant_games.dart';
import '../../models/jackpot_game_model.dart';

class DashboardMobilePortrait extends StatelessWidget {
  DashboardMobilePortrait({
    Key? key,
  }) : super(key: key);

  final SignUpController signUpController = Get.put(SignUpController());
  final DashboardController dashboardController =
      Get.put(DashboardController());
  final UserLocalDataSourceImpl user = Get.find();
  final WalletHomeController walletController = Get.put(WalletHomeController());

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
                  margin: const EdgeInsets.symmetric(horizontal: 18.0),
                  padding: const EdgeInsets.only(
                    top: 18,
                    bottom: 12,
                    left: 16,
                    right: 16,
                  ),
                  width: Get.width,
                  height: Get.height * .19,
                  decoration: BoxDecoration(
                    color: const Color(0XFF543884),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Wallet Balance:   ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Obx(
                            () => Text(
                              "₦" + walletController.balance.value.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Reward Points:   ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Obx(
                            () => Text(
                              // "90",
                              walletController.rewardPoints.value.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomMediumButton(
                              onPressed: () {
                                Get.to(
                                  () => const FundWalletView(),
                                  transition: Transition.cupertino,
                                );
                              },
                              // width: Get.width * .36,
                              fontSize: 12.0,
                              buttonText: 'Fund wallet',
                              buttonColor: Colors.white,
                              buttonTextColor: const Color(0xff414249),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: CustomMediumButton(
                              onPressed: () {
                                Get.to(
                                  () => const SelectBankView(),
                                  transition: Transition.cupertino,
                                );
                              },
                              // width: Get.width * .36,
                              fontSize: 12.0,
                              buttonText: 'Withdraw',
                              buttonColor: Colors.white,
                              buttonTextColor: const Color(0xff414249),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                InkWell(
                  onTap: () => {
                    Get.to(
                      () => EditProfileMobilePortrait(),
                      transition: Transition.cupertino,
                    ),
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        width: 2,
                        color: const Color(0XFFFE7A01),
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 18.0,
                      vertical: 24.0,
                    ),
                    padding: const EdgeInsets.only(
                      top: 18,
                      bottom: 18,
                      left: 16,
                      right: 16,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 58,
                          width: 58,
                          child: Stack(
                            children: const <Widget>[
                              SizedBox(
                                height: 58,
                                width: 58,
                                child: CircularProgressIndicator(
                                  value: 1,
                                  strokeWidth: 1.6,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xffD9D9D9),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 58,
                                width: 58,
                                child: CircularProgressIndicator(
                                  strokeWidth: 1.6,
                                  value: 0.7,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFFFE7A01),
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  '70%',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: .4,
                                    color: Color(0xFFFE7A01),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Gap(18),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Complete profile setup',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0XFFFE7A01),
                                ),
                              ),
                              Gap(8),
                              Text(
                                'Verify your Email to fund your wallet and have full access to all games.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff000000),
                                  height: 1.4,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        SvgPicture.asset('assets/svgs/complete_arrow.svg'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 360,
                  child: FutureBuilder<dynamic>(
                      future: dashboardController.getAllJackpotGames(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text(
                              "Snapshot has error: ${snapshot.hasError.toString()}");
                        } else if (snapshot.hasData) {
                          var body = snapshot.data["body"];
                          // dashboardController.timeRemainingInSecsForGames
                          //     .clear();
                          return body.length < 1
                              ? const Text(
                                  "No True or False Games Available",
                                )
                              : SizedBox(
                                  height: 360,
                                  width: Get.width,
                                  child: PageView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: JackpotGameResponse.fromJson(
                                            dashboardController.body)
                                        .body
                                        .length,
                                    controller:
                                        dashboardController.pageController,
                                    physics: const ScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Obx(
                                        () => DashboardHeroSession(
                                          onPressed: () {
                                            Get.to(
                                              () => JackpotGamesMobilePortrait(
                                                gameIndex: index,
                                                gameData: body[index],
                                                gameID: body[index]["gameID"]
                                                    ["_id"],
                                              ),
                                              transition: Transition.cupertino,
                                            );
                                          },
                                          priceToBeWon: body[index]["gameID"]
                                              ["imageUrl"],
                                          title: body[index]["gameID"]["title"],
                                          animation: StepTween(
                                            begin: dashboardController
                                                    .timeRemainingInSecsForGames[
                                                index],
                                            end: 0,
                                          ).animate(
                                            dashboardController
                                                .gamesAnimationControllers[
                                                    index]
                                                .value,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                        }
                        return const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 5,
                            color: Color(0xFFFE7A01),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 40,
                ),
                DashboardInstantGames(
                  onTap: () => Get.to(() => const TrueOrFalseView()),
                ),
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

