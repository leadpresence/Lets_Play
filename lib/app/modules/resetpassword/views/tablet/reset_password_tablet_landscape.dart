import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ResetPasswordTabletLandscape extends StatefulWidget {
  const ResetPasswordTabletLandscape({Key? key}) : super(key: key);

  @override
  State<ResetPasswordTabletLandscape> createState() => _ResetPasswordLandscapeState();
}

class _ResetPasswordLandscapeState extends State<ResetPasswordTabletLandscape> {
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