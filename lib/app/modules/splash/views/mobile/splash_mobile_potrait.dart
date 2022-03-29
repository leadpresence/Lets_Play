import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/splash/controllers/splash_controller.dart';

class SplashMobilePotrait extends StatefulWidget {
  const SplashMobilePotrait({Key? key}) : super(key: key);

  @override
  State<SplashMobilePotrait> createState() => _SplashMobilePotraitState();
}

class _SplashMobilePotraitState extends State<SplashMobilePotrait> {
  final SplashController controller = SplashController();
  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/images/jekawin_logo.svg';
    final Widget svg = SvgPicture.asset(
      assetName,
    );
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (context) {
        return Scaffold(
          body: ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Center(child: svg),
          ),
        );
      },
    );
  }
}
