import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
              InkWell(
                onTap: () => {
                  Get.to(
                    () => const RedeemPrizesMobilePortrait(),
                    transition: Transition.cupertino,
                  )
                },
                child: Container(
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
                              'assets/svgs/gift.svg',
                              color: const Color(0xffFE7A01),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            const Text(
                              'Redeem Prizes',
                              style: TextStyle(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
