import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/fund_wallet/controllers/fund_wallet_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/fund_wallet/views/mobile/fund_wallet_mobile_portrait.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FundWalletView extends GetView<FundWalletController> {
  const FundWalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ScreenTypeLayout.builder(

      mobile: (_) => OrientationLayoutBuilder(

        portrait: (_)=>  FundWalletMobilePortrait(),
        landscape: (_)=>  FundWalletMobilePortrait(),
        ),

        tablet: (_) => OrientationLayoutBuilder(

        portrait: (_) =>  FundWalletMobilePortrait(),
        landscape: (_)=> FundWalletMobilePortrait(),

        ));
  }
}