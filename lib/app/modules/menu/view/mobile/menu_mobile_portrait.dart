import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/referral/views/referral_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/reward_points/views/mobile/reward_points_mobile_portrait.dart';

import '../../../redeem_prizes/views/mobile/redeem_prizes_mobile_portrait.dart';

class MenuMobilePortrait extends StatelessWidget {
  const MenuMobilePortrait({Key? key}) : super(key: key);

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
                'Menu',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff414249),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  menuListTile(
                    onTap: () => Get.to(
                          () => const RewardPointsMobilePortrait(),
                      transition: Transition.cupertino,
                    ),
                    icon: 'assets/svgs/gift.svg',
                    tileText: 'Reward Points',
                  ),
                  menuListTile(
                    onTap: () => Get.to(
                      () => const RedeemPrizesMobilePortrait(),
                      transition: Transition.cupertino,
                    ),
                    icon: 'assets/svgs/gift.svg',
                    tileText: 'Redeem Prizes',
                  ),
                  menuListTile(
                    onTap: () => Get.to(
                      () => const ReferralView(),
                      transition: Transition.cupertino,
                    ),
                    icon: 'assets/svgs/share_referral.svg',
                    tileText: 'Referral',
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget menuListTile({
    onTap,
    icon,
    tileText,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          top: 8,
          bottom: 8,
        ),
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        width: Get.width,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xff414249).withOpacity(.3),
          ),
        ),
        child: Center(
          child: Row(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    icon,
                    color: const Color(0xffFE7A01),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    tileText,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(
                        0xff414249,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
