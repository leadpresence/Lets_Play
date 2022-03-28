import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jekawin_mobile_flutter/app/modules/auth/views/mobile/auth_home_mobile_landscape.dart';
import 'package:jekawin_mobile_flutter/app/modules/auth/views/mobile/auth_home_mobile_potrait.dart';
import 'package:jekawin_mobile_flutter/app/modules/auth/views/tablet/auth_home_tablet_landscape.dart';
import 'package:jekawin_mobile_flutter/app/modules/auth/views/tablet/auth_home_tablet_potrait.dart';
import 'package:responsive_builder/responsive_builder.dart';


class AuthHome extends StatefulWidget {
  const AuthHome({Key? key}) : super(key: key);

  @override
  State<AuthHome> createState() => _AuthHomeState();
}

class _AuthHomeState extends State<AuthHome> {
  @override
  Widget build(BuildContext context) {
    return  ScreenTypeLayout.builder(
        mobile: (_) => OrientationLayoutBuilder(

      portrait: (_)=> const AuthHomeMobilePotriat(),
      landscape: (_)=>const AuthHomeMobileLandscape(),
    ),
    tablet: (_) => OrientationLayoutBuilder(
    portrait: (_) => const AuthHomeTabletPortrait(),
    landscape: (_)=>
    const AuthHomeTabletLandscape(),

    ));
  }
}

