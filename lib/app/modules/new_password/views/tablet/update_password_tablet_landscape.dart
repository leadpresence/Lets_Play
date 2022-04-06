import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UpdatePasswordTabletLandscape extends StatefulWidget {
  const UpdatePasswordTabletLandscape({Key? key}) : super(key: key);

  @override
  State<UpdatePasswordTabletLandscape> createState() => _UpdatePasswordTabletLandscapeState();
}

class _UpdatePasswordTabletLandscapeState extends State<UpdatePasswordTabletLandscape> {
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