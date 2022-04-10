import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/config/colors.dart';
import 'package:jekawin_mobile_flutter/app/modules/jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';
import 'package:jekawin_mobile_flutter/app/modules/login/controllers/login_controller.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_large_button.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_text_field.dart';

import '../../../../config/themes/app_theme_constants.dart';
import '../../../../constants/asset_paths.dart';
import '../../../auth/controllers/auth_controller.dart';

class LoginMobilePortrait extends GetView<LoginController> {
  const LoginMobilePortrait({Key? key, this.themeData, this.customAppTheme})
      : super(key: key);
  final ThemeData? themeData;
  final CustomAppTheme? customAppTheme;

  @override
  Widget build(BuildContext context) {
    TextEditingController? phoneNumberController;
    TextEditingController? passwordController;
    bool agree = false;

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
      Scaffold(
          body: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Gap(30),

              //Logo Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [logoSvg],
              ),
              const Gap(40),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Log In",
                    style: TextStyle(
                        fontWeight: FontWeight.w300, // light
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                        fontSize: 24 // italic
                    ),
                  )
                ],
              ),

              const Gap(20),

              const Padding(
                  padding: EdgeInsets.fromLTRB(24, 40, 24, 10),
                  child: CustomTextField(
                    hintText: "Phone number",
                  )),

              const Padding(
                  padding: EdgeInsets.fromLTRB(24, 12, 24, 10),
                  child: CustomTextField(
                    isPasswordField: true,
                    hintText: "Password",
                  )),

              // Row(
              //   children: [
              //     Material(
              //       child: Checkbox(
              //         value: agree,
              //         onChanged: (value) {
              //           // setState(() {
              //           //   agree = value ?? false;
              //           // });
              //         },
              //       ),
              //     ),
              //     SizedBox(
              //       width: (screenWidth(context) * 0.75),
              //       child: const Text(
              //         'I agree to the Jekawin Term of Service and \nPrivacy Policy',
              //         overflow: TextOverflow.ellipsis,
              //         style: TextStyle(color: agreementColor),
              //       ),
              //     )
              //   ],
              // ),

              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 10),
                child: CustomButton(
                    buttonText: "Log In",
                    onPressed: () => Get.to(() => const JekawinBottomTabs(
                      tabIndex: 0,
                    ))),
              )
            ]),
          )
        // )
      );
  }

  void submit() {}

  void _doSomething() {}
}
