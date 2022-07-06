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
import '../../../user_profile/views/mobile/user_profile_mobile_portrait.dart';
import '../../../wallet_home/controllers/wallet_home_controller.dart';
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
                            'Wallet Balance: ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Obx(
                            () => Text(
                              "₦ " + walletController.balance.value.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Reward points: ',
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
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomMediumButton(
                            onPressed: () {
                              Get.to(
                                () => const FundWalletView(),
                                transition: Transition.cupertino,
                              );
                            },
                            width: Get.width * .36,
                            fontSize: 12.0,
                            buttonText: 'Fund wallet',
                            buttonColor: Colors.white,
                            buttonTextColor: const Color(0xff414249),
                          ),
                          CustomMediumButton(
                            onPressed: () {
                              Get.to(
                                () => const SelectBankView(),
                                transition: Transition.cupertino,
                              );
                            },
                            width: Get.width * .36,
                            fontSize: 12.0,
                            buttonText: 'Withdraw',
                            buttonColor: Colors.white,
                            buttonTextColor: const Color(0xff414249),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => {
                    Get.to(
                      () => EditProfileMobilePortrait(),
                      transition: Transition.cupertino,
                    ),
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(16)),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 18.0,
                      vertical: 18.0,
                    ),
                    padding: const EdgeInsets.only(
                      top: 18,
                      bottom: 12,
                      left: 16,
                      right: 16,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Complete Setup',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff000000),
                                ),
                              ),
                              Gap(6),
                              Text(
                                'Complete your account setup to fund wallet and enjoy more upcoming benefits',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff000000),
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                          return SizedBox(
                            height: 360,
                            width: Get.width,
                            child: PageView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: body.length,
                              controller: dashboardController.pageController,
                              physics: const ScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Obx(
                                  () => DashboardHeroSession(
                                    onPressed: () {
                                      Get.to(
                                        () => JackpotGamesMobilePortrait(
                                          gameIndex: index,
                                          gameID: body[index]["gameID"]["_id"],
                                        ),
                                        transition: Transition.cupertino,
                                      );
                                    },
                                    priceToBeWon: body[index]["gameID"]
                                        ["price"],
                                    title: body[index]["gameID"]["title"],
                                    animation: StepTween(
                                      begin: dashboardController
                                          .timeRemainingInSecsForGames[index],
                                      end: 0,
                                    ).animate(
                                      dashboardController
                                          .gamesAnimationControllers[index]
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
                  height: 60,
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
