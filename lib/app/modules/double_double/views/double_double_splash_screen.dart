import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'double_double_instruction_screen.dart';

class DoubleDoubleSplash extends StatelessWidget {
  DoubleDoubleSplash({Key? key}) : super(key: key);

  final DoubleDoubleSplashController controller =
      DoubleDoubleSplashController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoubleDoubleSplashController>(
      init: DoubleDoubleSplashController(),
      builder: (context) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/svgs/double_double_big_ii.png',
                  height: 400,
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class DoubleDoubleSplashController extends GetxController {
  // var token = GetStorage().read('token');

  @override
  void onInit() {
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.off(() => const DoubleDoubleInstruction()),
    );
    super.onInit();
  }
}
