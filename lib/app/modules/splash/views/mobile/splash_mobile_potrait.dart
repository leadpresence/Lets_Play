import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
 

class SplashMobilePotrait extends StatefulWidget {
  const SplashMobilePotrait({Key? key}) : super(key: key);

  @override
  State<SplashMobilePotrait> createState() => _SplashMobilePotraitState();
}

class _SplashMobilePotraitState extends State<SplashMobilePotrait> {
  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/images/jekawin_logo.svg';
    final Widget svg = SvgPicture.asset(
      assetName,
    );
    return Scaffold(body: Center(child: svg));
  }
}
