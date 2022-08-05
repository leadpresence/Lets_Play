import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/referral/controllers/referral_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'mobile/start_true_false_game_mobile_portrait.dart';
import 'mobile/true_or_false_mobile_portrait.dart';

class TrueOrFalseView extends GetView<ReferralController> {
  const TrueOrFalseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => OrientationLayoutBuilder(
        portrait: (_) => const TrueOrFalseMobilePortrait(),
        landscape: (_) => const TrueOrFalseMobilePortrait(),
      ),
      tablet: (_) => OrientationLayoutBuilder(
        portrait: (_) => const TrueOrFalseMobilePortrait(),
        landscape: (_) => const TrueOrFalseMobilePortrait(),
      ),
    );
  }
}
