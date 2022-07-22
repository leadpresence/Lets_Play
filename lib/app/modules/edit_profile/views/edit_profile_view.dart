import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/edit_profile/controllers/edit_profile_controllers.dart';
import 'package:jekawin_mobile_flutter/app/modules/edit_profile/views/mobile/edit_profile_mobile_porttrait.dart';
import 'package:responsive_builder/responsive_builder.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => OrientationLayoutBuilder(
        portrait: (_) => EditProfileMobilePortrait(),
        landscape: (_) => EditProfileMobilePortrait(),
      ),
      tablet: (_) => OrientationLayoutBuilder(
        portrait: (_) => EditProfileMobilePortrait(),
        landscape: (_) => EditProfileMobilePortrait(),
      ),
    );
  }
}
