import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpTabletPortrait extends StatefulWidget {
  const SignUpTabletPortrait({Key? key}) : super(key: key);

  @override
  State<SignUpTabletPortrait> createState() => _SignUpTabletPortrait();
}

class _SignUpTabletPortrait extends State<SignUpTabletPortrait> {
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