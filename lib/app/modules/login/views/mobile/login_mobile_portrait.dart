import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jekawin_mobile_flutter/app/config/colors.dart';
import 'package:jekawin_mobile_flutter/app/modules/login/controllers/login_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/resetpassword/views/reset_password.dart';
import 'package:jekawin_mobile_flutter/app/modules/signup/views/sign_up.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_large_button.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_text_field.dart';
import '../../../../config/themes/app_theme_constants.dart';
import '../../../../constants/asset_paths.dart';

class LoginMobilePortrait extends GetView<LoginController> {
  @override
  final LoginController controller = Get.put(LoginController());

  LoginMobilePortrait({Key? key, this.themeData, this.customAppTheme})
      : super(key: key);
  final ThemeData? themeData;
  final CustomAppTheme? customAppTheme;

  @override
  Widget build(BuildContext context) {
    const TextStyle errorTextStyle = TextStyle(
      fontSize: 10,
      color: Colors.deepOrange,
      letterSpacing: .2,
      fontWeight: FontWeight.bold,
    );

    final Widget logoSvg = SvgPicture.asset(
      logoAsetName,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.090,
    );
    // screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: controller.loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [logoSvg],
                  ),
                  const Gap(48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login",
                        style: GoogleFonts.mulish(
                            fontWeight: FontWeight.normal, // light
                            fontStyle: FontStyle.normal,
                            color: Colors.black,
                            fontSize: 24 // italic
                            ),
                      )
                    ],
                  ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 40, 24, 4),
                    child: CustomTextField(
                      hintText: "Phone number",
                      keyboardType: TextInputType.number,
                      textController: controller.phoneNumberController,
                      onChanged: (v) {
                        if (v.isNotEmpty) controller.clearErrorPhoneNumber();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          controller.errorPhoneNumberMessage.value,
                          style: errorTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 8, 24, 4),
                    child: CustomTextField(
                      hintText: "Password",
                      isPasswordField: true,
                      textController: controller.passwordController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          controller.errorPasswordMessage.value,
                          style: errorTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
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
                            style:
                                TextStyle(color: agreementColor, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: CustomButton(
                      isLoading: controller.isLoading.value,
                      buttonText: "Login",
                      onPressed: () {
                        controller.loginFormValidator(key);
                      },
                    ),
                  ),
                  const Gap(8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 8.0),
                    width: Get.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mulish(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xff12121D).withOpacity(.6),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.off(() => const SignUpView());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'Sign Up',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.mulish(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: const Color(0xff262254),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(12),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
