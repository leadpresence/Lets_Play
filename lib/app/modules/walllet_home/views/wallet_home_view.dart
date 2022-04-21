import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/walllet_home/controllers/wallet_home_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/walllet_home/views/mobile/wallet_home_mobile_portrait.dart';
import 'package:responsive_builder/responsive_builder.dart';

class WalletHomeView extends GetView<WalletHomeController> {
  const WalletHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ScreenTypeLayout.builder(
        mobile: (_) => OrientationLayoutBuilder(

          portrait: (_)=>  WalletHomeMobilePortrait(),
          landscape: (_)=>  WalletHomeMobilePortrait(),
        ),
        tablet: (_) => OrientationLayoutBuilder(
          portrait: (_) =>     WalletHomeMobilePortrait(),
          landscape: (_)=>
           WalletHomeMobilePortrait(     ),

        ));
  }
}