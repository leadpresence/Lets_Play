import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UpdatePasswordTabletPortrait extends StatefulWidget {
  const UpdatePasswordTabletPortrait({Key? key}) : super(key: key);

  @override
  State<UpdatePasswordTabletPortrait> createState() => _UpdatePasswordTabletPortrait();
}

class _UpdatePasswordTabletPortrait extends State<UpdatePasswordTabletPortrait> {
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