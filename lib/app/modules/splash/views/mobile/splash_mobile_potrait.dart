import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/splash/controllers/splash_controller.dart';
import 'package:jekawin_mobile_flutter/app/widgets/fade_in_animations.dart';

class SplashMobilePortrait extends StatefulWidget {
  const SplashMobilePortrait({Key? key}) : super(key: key);

  @override
  State<SplashMobilePortrait> createState() => _SplashMobilePortraitState();
}

class _SplashMobilePortraitState extends State<SplashMobilePortrait> {
  final SplashController controller = SplashController();
  final String assetName = 'assets/images/jekawin_logo.svg',
      splashBottomImage = 'assets/images/splash_bottom.png',
      splashTopImage = 'assets/images/splash_top.png';
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (context) {
        return Scaffold(
          body: ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FadeIn(
                    delay: const Duration(seconds: 1),
                    duration: const Duration(seconds: 1),
                    child: Image.asset(splashTopImage)),
                FadeIn(
                  delay: const Duration(seconds: 1),
                  duration: const Duration(seconds: 1),
                  child: SvgPicture.asset(
                    assetName,
                  ),
                ),
                const SizedBox(height: 24),
                FadeIn(
                    delay: const Duration(seconds: 1),
                    duration: const Duration(seconds: 1),
                    child: Image.asset(splashBottomImage)),
              ],
            ),
          ),
        );
      },
    );
  }
}
