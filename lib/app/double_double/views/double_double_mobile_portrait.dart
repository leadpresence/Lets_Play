import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DoubleDoubleMobilePortrait extends StatelessWidget {
  const DoubleDoubleMobilePortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 52.0),
                child: Image.asset(
                  'assets/svgs/double_double_big.png',
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 52.0),
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
            ],
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
