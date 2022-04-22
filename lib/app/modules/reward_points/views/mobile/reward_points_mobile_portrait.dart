import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/reward_points/views/mobile/share_reward_points_mobile_portrait.dart';

import '../../../../widgets/custom_medium_button.dart';

class RewardPointsMobilePortrait extends StatelessWidget {
  const RewardPointsMobilePortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
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
              Container(
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
                      children: const [
                        Text(
                          'Reward points : ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '0',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
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
                        Text(
                          '10%',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
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
                              () => const ShareRewardPointsMobilePortrait(),
                              transition: Transition.cupertino,
                            );
                          },
                          width: Get.width * .36,
                          fontSize: 12.0,
                          buttonText: 'Share points',
                          buttonColor: Colors.white,
                          buttonTextColor: const Color(0xff414249),
                        ),
                        CustomMediumButton(
                          onPressed: () {},
                          width: Get.width * .36,
                          fontSize: 12.0,
                          buttonText: 'Buy Points',
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
              Column(
                children: [
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
                  SizedBox(
                    height: Get.height * .35,
                    child: const Center(
                      child: Text(
                        'No Transaction History',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xff414249),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
