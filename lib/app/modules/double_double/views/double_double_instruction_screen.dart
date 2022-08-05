import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_large_button.dart';
import 'double_double_mobile_portrait.dart';

class DoubleDoubleInstruction extends StatelessWidget {
  const DoubleDoubleInstruction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 36.0),
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
          Image.asset(
            'assets/svgs/double_double_big_ii.png',
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsets.all(3),
            margin: const EdgeInsets.symmetric(horizontal: 24.0),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xffFE7A01),
                  Color(0xff915DC0),
                  Color(0xffFE7A01),
                  Color(0xffAD0C5A),
                  Color(0xff720BA3),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xff543884),
                borderRadius: BorderRadius.circular(17),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/svgs/note_that.svg',
                    color: Colors.white,
                    height: 16,
                  ),
                  const Expanded(
                    child: Text(
                      'Click on the two Items with the same price, pair the other items in same sequence',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 48,
          ),
          SizedBox(
            width: Get.width * .28,
            child: CustomButton(
              // isLoading: controller.isLoading.value,
              height: 40.0,
              onPressed: () {
                Get.to(() => const DoubleDoubleMobilePortrait());
              },
              buttonText: 'Okay',
              buttonColor: const Color(0xFFFE7A01),
            ),
          ),
          // const SizedBox(
          //   height: 240,
          // ),
        ],
      ),
    );
  }
}
