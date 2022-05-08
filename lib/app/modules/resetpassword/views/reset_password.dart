import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/resetpassword/views/mobile/reset_password_mobile_landscape.dart';
import 'package:jekawin_mobile_flutter/app/modules/resetpassword/views/mobile/reset_password_mobile_potrait.dart';
import 'package:jekawin_mobile_flutter/app/modules/resetpassword/views/tablet/reset_password_tablet_landscape.dart';
import 'package:jekawin_mobile_flutter/app/modules/resetpassword/views/tablet/reset_password_tablet_potrait.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordPhoneView extends GetView<ResetPasswordController> {
  const ResetPasswordPhoneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (_) => OrientationLayoutBuilder(
              portrait: (_) => ResetPasswordMobilePortrait(),
              landscape: (_) => const ResetPasswordMobileLandscape(),
            ),
        tablet: (_) => OrientationLayoutBuilder(
              portrait: (_) => const ResetPasswordTabletPortrait(),
              landscape: (_) => const ResetPasswordTabletLandscape(),
            ));
  }
}
