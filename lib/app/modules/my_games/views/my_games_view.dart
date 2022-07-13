import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../controller/my_games_controller.dart';
import 'mobile/my_games_mobile_portrait.dart';

class MyGamesView extends GetView<MyGamesController> {
  const MyGamesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => OrientationLayoutBuilder(
        portrait: (_) => MyGamesMobilePortrait(),
        landscape: (_) => MyGamesMobilePortrait(),
      ),
      tablet: (_) => OrientationLayoutBuilder(
        portrait: (_) => MyGamesMobilePortrait(),
        landscape: (_) => MyGamesMobilePortrait(),
      ),
    );
  }
}
