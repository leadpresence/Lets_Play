import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ResetPasswordTabletPortrait extends StatefulWidget {
  const ResetPasswordTabletPortrait({Key? key}) : super(key: key);

  @override
  State<ResetPasswordTabletPortrait> createState() => _ResetPasswordTabletPortrait();
}

class _ResetPasswordTabletPortrait extends State<ResetPasswordTabletPortrait> {
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