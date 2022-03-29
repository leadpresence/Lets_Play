import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../config/themes/app_theme_constants.dart';
import '../../../../constants/asset_paths.dart';
import '../../../auth/controllers/auth_controller.dart';
import '../../controllers/sign_up_controller.dart';

class SignupMobilePortrait extends GetView<SignUpController> {
  const SignupMobilePortrait({Key? key,this.themeData,this.customAppTheme}) : super(key: key);
  final ThemeData? themeData;
  final CustomAppTheme? customAppTheme;

  @override
  Widget build(BuildContext context) {

    TextEditingController? phoneNumberController;
    TextEditingController? passwordController;

    @override
    void initState() {
      // super.initState();
      phoneNumberController = TextEditingController();
      // emailTFController = TextEditingController();
      passwordController = TextEditingController();
    }

    @override
    void dispose() {
      // phoneNumberController.dispose();
      // passwordTFController.dispose();
      // super.dispose();
    }


    final Widget logoSvg = SvgPicture.asset(
      logoAsetName,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.150,
    );
    return Scaffold(body: SingleChildScrollView(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(30),

          //Logo Row
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logoSvg
      ],),
          const Gap(40),

          Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
         Text("Sign up", style: TextStyle(
           fontWeight: FontWeight.w300, // light
           fontStyle: FontStyle.normal,
           color: Colors.black,
           fontSize: 24// italic
         ),)

      ],),

          Container(
            margin:   const EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: TextFormField(
              style: AppTheme.getTextStyle(
                  themeData?.textTheme.bodyText1,
                  letterSpacing: 0.1,
                  color: themeData?.colorScheme.onBackground,
                  fontWeight: 500),
              decoration: InputDecoration(
                  hintText: "Phone number",
                  hintStyle: AppTheme.getTextStyle(
                      themeData?.textTheme.subtitle2,
                      letterSpacing: 0.1,
                      color: themeData?.colorScheme.onBackground,
                      fontWeight: 500),
                  border:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.grey, width: 1.5),
                  ),
                  // enabledBorder: allTFBorder,
                  // focusedBorder: allTFBorder,
                  isDense: true,
                  contentPadding:const EdgeInsets.all(20.0)),
              keyboardType: TextInputType.text,
              // controller: phoneNumberController,
              textCapitalization: TextCapitalization.sentences,
            ),
          ),

    ])));
  }
}
