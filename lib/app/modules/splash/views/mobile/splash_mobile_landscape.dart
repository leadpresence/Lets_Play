import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: slash_for_doc_comments
/**
 
 * this class is used to display splas to user
 */

class SplashMobileLandscape extends StatefulWidget {
  const SplashMobileLandscape({Key? key}) : super(key: key);

  @override
  State<SplashMobileLandscape> createState() => _SplashMobileLandscapeState();
}

class _SplashMobileLandscapeState extends State<SplashMobileLandscape> {
  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/images/jekawin_logo.svg';
    final Widget svg = SvgPicture.asset(
      assetName,
    );
    return Scaffold(body: Center(child: svg));
    
  }
}
