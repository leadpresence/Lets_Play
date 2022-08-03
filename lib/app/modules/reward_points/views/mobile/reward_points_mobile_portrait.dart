import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jekawin_mobile_flutter/app/modules/reward_points/controllers/reward_points_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/reward_points/views/mobile/share_reward_points_mobile_portrait.dart';

import '../../../../constants/asset_paths.dart';
import '../../../../widgets/custom_medium_button.dart';
import '../../models/reward_points_response_model.dart';

enum RewardPointTypes {
  referral,
  trueOrFalseGame,
  doubleDouble,
  gift,
}

class RewardPointsMobilePortrait extends StatelessWidget {
  RewardPointsMobilePortrait({Key? key}) : super(key: key);

  final RewardPointsController controller = Get.put(RewardPointsController());

  final Widget debitIcon = SvgPicture.asset(
    debitSvg,
    height: 24,
    width: 24,
  );

  final Widget creditIcon = SvgPicture.asset(
    creditSvg,
    height: 24,
    width: 24,
  );

  final DateFormat formatter = DateFormat('yyyy-MM-dd');

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
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 12.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Reward Points',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff414249),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              FutureBuilder<RewardPointsResponseModel?>(
                future: controller.rewardPointsHistory(key),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 104.0),
                        child: Text(
                            "Snapshot has error: ${snapshot.hasError.toString()}"),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    RewardPointsResponseModel? body = snapshot.data!;
                    return body.data!.history!.isEmpty
                        ? SizedBox(
                            height: Get.height * .35,
                            child: const Center(
                              child: Text(
                                'No Transaction History',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff414249),
                                  height: 1.6,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        : Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                  top: 18,
                                  bottom: 12,
                                  left: 16,
                                  right: 16,
                                ),
                                width: Get.width,
                                height: Get.height < 700
                                    ? Get.height * .23
                                    : Get.height * .19,
                                decoration: BoxDecoration(
                                  color: const Color(0XFF543884),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
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
                                        Text(
                                          body.data!.total.toString(),
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Discount percentage: ',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          body.data!.discountPercentage
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomMediumButton(
                                          onPressed: () {
                                            Get.to(
                                              () =>
                                                  ShareRewardPointsMobilePortrait(),
                                              transition: Transition.cupertino,
                                            );
                                          },
                                          width: Get.width * .36,
                                          fontSize: 12.0,
                                          buttonText: 'Share points',
                                          buttonColor: Colors.white,
                                          buttonTextColor:
                                              const Color(0xff414249),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'History',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff414249),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              for (int i = 0;
                                  i < body.data!.history!.length;
                                  i++)
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        spreadRadius: 1,
                                        offset: const Offset(0, 10),
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 25,
                                      ),
                                    ],
                                  ),
                                  margin: const EdgeInsets.only(bottom: 16),
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 16, 16, 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          body.data!.history![i].id ==
                                                  "true or false game"
                                              ? debitIcon
                                              : creditIcon,
                                          Text(
                                            formatter.format(
                                                body.data!.history![i].time!),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Gap(8),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            body.data!.history![i].id ==
                                                    "true or false game"
                                                ? "Instant Game"
                                                : "Debit",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            '${body.data!.history![i].total.toString()} RPT',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          );
                  }
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: 18,
                          bottom: 12,
                          left: 16,
                          right: 16,
                        ),
                        width: Get.width,
                        height: Get.height < 700
                            ? Get.height * .23
                            : Get.height * .19,
                        decoration: BoxDecoration(
                          color: const Color(0XFF543884),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  'Reward points: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                CupertinoActivityIndicator(
                                  color: Colors.white70,
                                  // strokeWidth: 3,
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Discount percentage: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                CupertinoActivityIndicator(
                                  color: Colors.white70,
                                  // strokeWidth: 3,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomMediumButton(
                                  onPressed: () {},
                                  width: Get.width * .36,
                                  fontSize: 12.0,
                                  buttonText: 'Share points',
                                  buttonColor: Colors.white,
                                  buttonTextColor: const Color(0xff414249),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'History',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff414249),
                          ),
                        ),
                      ),
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 104.0),
                          child: CupertinoActivityIndicator(
                            color: Color(0xffFE7A01),
                            // strokeWidth: 3,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
