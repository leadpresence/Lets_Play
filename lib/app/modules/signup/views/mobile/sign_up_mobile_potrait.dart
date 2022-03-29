import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jekawin_mobile_flutter/app/config/colors.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_large_button.dart';

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
    bool agree  = false;

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
    screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

    return
      // Obx(
      // ()=>
          Scaffold(body: SingleChildScrollView(child: Column(
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
            const Gap(40),

            Row(
              children:  [
                Material(
                  child: Checkbox(
                    value: agree,
                    onChanged: (value) {
                      // setState(() {
                      //   agree = value ?? false;
                      // });
                    },

                  ),
                ),
              SizedBox(
                width: (screenWidth(context)*0.75),
                child: const Text(
                     'I agree to the Jekawin Term of Service and \nPrivacy Policy',
                     overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: agreementColor),
                   ),
              )
              ],
            ),


          Padding(
            padding: const EdgeInsets.fromLTRB(10,5,10,10),
            child:CustomButton(buttonText: "Sign Up",onPressed: (){}) ,)

      ]),
    )
      // )
    );

  }

  void submit(){}
  void _doSomething(){}
}
