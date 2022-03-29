import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/auth/views/tablet/auth_home_tablet_landscape.dart';
import 'package:jekawin_mobile_flutter/app/modules/auth/views/tablet/auth_home_tablet_potrait.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../controllers/auth_controller.dart';
import 'mobile/auth_home_mobile_landscape.dart';
import 'mobile/auth_home_mobile_potrait.dart';


class AuthHomeView extends GetView<AuthHomeController> {
  const AuthHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ScreenTypeLayout.builder(
        mobile: (_) => OrientationLayoutBuilder(
      portrait: (_)=> const AuthHomeMobilePortrait(),
      landscape: (_)=>const AuthHomeMobileLandscape(),
    ),
    tablet: (_) => OrientationLayoutBuilder(
    portrait: (_) => const AuthHomeTabletPortrait(),
    landscape: (_)=>
    const AuthHomeTabletLandscape(),

    ));
  }
}

