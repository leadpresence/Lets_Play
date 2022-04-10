import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/login/views/tablet/login_tablet.landscape.dart';
import 'package:jekawin_mobile_flutter/app/modules/login/views/tablet/login_tablet_portrait.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../controllers/login_controller.dart';
import 'mobile/login_mobile.landscape.dart';
import 'mobile/login_mobile_portrait.dart';
class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ScreenTypeLayout.builder(
        mobile: (_) => OrientationLayoutBuilder(

          portrait: (_)=> const LoginMobilePortrait(),
          landscape: (_)=>const LoginMobileLandscape(),
        ),
        tablet: (_) => OrientationLayoutBuilder(
          portrait: (_) => const   LoginTabletPortrait(),
          landscape: (_)=>
          const LoginTabletLandscape(),

        ));
  }
}
