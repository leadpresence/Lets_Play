import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/select_account/controller/select_bank_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'mobile/select_bank_mobile_portrait.dart';

class SelectBankView extends GetView<SelectBankController> {
  const SelectBankView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ScreenTypeLayout.builder(

        mobile: (_) => OrientationLayoutBuilder(

          portrait: (_)=>  SelectBankMobilePortrait(),
          landscape: (_)=>  SelectBankMobilePortrait(),
        ),

        tablet: (_) => OrientationLayoutBuilder(

          portrait: (_) =>  SelectBankMobilePortrait(),
          landscape: (_)=> SelectBankMobilePortrait(),

        ));
  }
}