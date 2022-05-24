import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/referral/controllers/referral_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'mobile/referral_mobile_portrait.dart';

class ReferralView extends GetView<ReferralController> {
  const ReferralView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => OrientationLayoutBuilder(
        portrait: (_) => ReferralMobilePortrait(),
        landscape: (_) => ReferralMobilePortrait(),
      ),
      tablet: (_) => OrientationLayoutBuilder(
        portrait: (_) => ReferralMobilePortrait(),
        landscape: (_) => ReferralMobilePortrait(),
      ),
    );
  }
}
