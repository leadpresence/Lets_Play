import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/config/colors.dart';
import 'package:jekawin_mobile_flutter/app/modules/login/controllers/login_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/resetpassword/views/reset_password.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_large_button.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_text_field.dart';
import '../../../../config/themes/app_theme_constants.dart';
import '../../../../constants/asset_paths.dart';
import '../../../jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';

class LoginMobilePortrait extends GetView<LoginController> {

  @override
  final LoginController controller = Get.put(LoginController());

    LoginMobilePortrait({Key? key, this.themeData, this.customAppTheme})
      : super(key: key);
  final ThemeData? themeData;
  final CustomAppTheme? customAppTheme;

  @override
  Widget build(BuildContext context) {

    @override
    void initState() {
      // super.initState();
    }

    @override
    void dispose() {}

    final Widget logoSvg = SvgPicture.asset(
      logoAsetName,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.150,
    );
    screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

    return
      // Obx(() =>
          Scaffold(
            body: SingleChildScrollView(
          child: Form(
            key: controller.loginFormKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    "Login",
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

              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                  child: CustomTextField(
                    hintText: "Phone number",
                    textController: controller.phoneNumberController,
                  )),

              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                  child: CustomTextField(
                    hintText: "Password",
                    isPasswordField: true,
                    textController: controller.passwordController,
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Get.to(() => ResetPasswordPhoneView(
                            key: key,
                          )),
                      child: const Text(
                        'Forgot password?',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: agreementColor, fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: CustomButton(
                    buttonText: "Login",
                    onPressed: () {

                      // controller.login(key);
                      Get.to(() => const JekawinBottomTabs(
                        tabIndex: 0,
                      ));
                    }
                ),
              )
            ]),
          ),
        // )
          ));
  }
}
