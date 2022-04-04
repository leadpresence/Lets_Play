import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpTabletLandscape extends StatefulWidget {
  const SignUpTabletLandscape({Key? key}) : super(key: key);

  @override
  State<SignUpTabletLandscape> createState() => _SignUpTabletLandscapeState();
}

class _SignUpTabletLandscapeState extends State<SignUpTabletLandscape> {
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