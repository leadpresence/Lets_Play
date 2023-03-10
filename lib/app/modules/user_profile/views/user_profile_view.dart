import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/user_profile/controllers/user_profile_cntroller.dart';
import 'package:jekawin_mobile_flutter/app/modules/user_profile/views/mobile/user_profile_mobile_portrait.dart';
import 'package:responsive_builder/responsive_builder.dart';

class UserProfileView extends GetView<UserProfileController> {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => OrientationLayoutBuilder(
        portrait: (_) => UserProfileMobilePortrait(),
        landscape: (_) => UserProfileMobilePortrait(),
      ),
      tablet: (_) => OrientationLayoutBuilder(
        portrait: (_) => UserProfileMobilePortrait(),
        landscape: (_) => UserProfileMobilePortrait(),
      ),
    );
  }
}
