import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class RedeemPrizesMobilePortrait extends StatelessWidget {
  const RedeemPrizesMobilePortrait({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
          child: SizedBox(
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Redeem prize',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff414249),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Image.asset('assets/images/package.png', width: Get.width * .7,),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'You don’t have any prize yet',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff414249),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
