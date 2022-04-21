import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/add_bank_acccount/controllers/add_bank_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'mobile/add_bank_mobile_protrait.dart';

class AddBankView extends GetView<AddBankController > {
  const AddBankView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ScreenTypeLayout.builder(

        mobile: (_) => OrientationLayoutBuilder(

          portrait: (_)=>   AddBankMobilePortrait(),
          landscape: (_)=>  AddBankMobilePortrait(),
        ),

        tablet: (_) => OrientationLayoutBuilder(

          portrait: (_) =>  AddBankMobilePortrait(),
          landscape: (_)=> AddBankMobilePortrait(),

        ));
  }
}