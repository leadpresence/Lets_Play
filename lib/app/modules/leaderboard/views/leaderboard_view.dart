import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../controllers/leaderbooard_controller.dart';
import 'mobile/leaderboard_mobile_portrait.dart';

class LeaderBoardView extends GetView<LeaderBoardController> {
  const LeaderBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (_) => OrientationLayoutBuilder(
              portrait: (_) => LeaderBoardMobilePortrait(),
              landscape: (_) => LeaderBoardMobilePortrait(),
            ),
        tablet: (_) => OrientationLayoutBuilder(
              portrait: (_) => LeaderBoardMobilePortrait(),
              landscape: (_) => LeaderBoardMobilePortrait(),
            ));
  }
}
