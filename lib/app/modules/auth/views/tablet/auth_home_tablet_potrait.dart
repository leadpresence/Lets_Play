import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthHomeTabletPortrait extends StatefulWidget {
  const AuthHomeTabletPortrait({Key? key}) : super(key: key);

  @override
  State<AuthHomeTabletPortrait> createState() => _AuthHomeTabletPortraitState();
}

class _AuthHomeTabletPortraitState extends State<AuthHomeTabletPortrait> {
  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/images/jekawin_logo.svg';
    final Widget svg = SvgPicture.asset(
      assetName,
    );
    return Scaffold(body:
    Center(child: svg));

  }
}