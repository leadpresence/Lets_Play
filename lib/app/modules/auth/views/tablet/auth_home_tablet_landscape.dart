import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthHomeTabletLandscape extends StatefulWidget {
  const AuthHomeTabletLandscape({Key? key}) : super(key: key);

  @override
  State<AuthHomeTabletLandscape> createState() => _AuthHomeTabletLandscapeState();
}

class _AuthHomeTabletLandscapeState extends State<AuthHomeTabletLandscape> {
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