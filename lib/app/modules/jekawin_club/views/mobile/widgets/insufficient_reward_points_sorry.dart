import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class InsufficientRewardPoints extends StatelessWidget {
  const InsufficientRewardPoints({Key? key}) : super(key: key);

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
            splashRadius: 24,
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
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/feeling_sad.png',
              // color: const Color(0xff12121D),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'You don’t have Enough reward Points to Join this club, Win more games to earn more reward points',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
