import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jekawin_mobile_flutter/app/config/colors.dart';
import 'package:jekawin_mobile_flutter/app/modules/login/views/login.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_large_button.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_text_field.dart';
import '../../../../config/themes/app_theme_constants.dart';
import '../../../../constants/asset_paths.dart';
import '../../controllers/sign_up_controller.dart';

class SignupMobilePortrait extends GetView<SignUpController> {
  @override
  final SignUpController controller = Get.put(SignUpController());

  SignupMobilePortrait({Key? key, this.themeData, this.customAppTheme})
      : super(key: key);
  final ThemeData? themeData;
  final CustomAppTheme? customAppTheme;

  @override
  Widget build(BuildContext context) {
    const TextStyle errorTextStyle = TextStyle(
      fontSize: 10,
      color: Colors.deepOrange,
      // height: 1.8,
      letterSpacing: .2,
      fontWeight: FontWeight.bold,
    );
    final Widget logoSvg = SvgPicture.asset(
      logoAsetName,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.090,
    );
    screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
    screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: controller.signUpFormKey,
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
                        "Sign up",
                        style: GoogleFonts.mulish(
                            fontWeight: FontWeight.normal, // light
                            fontStyle: FontStyle.normal,
                            color: Colors.black,
                            fontSize: 24 // italic
                            ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 40, 24, 4),
                    child: CustomTextField(
                      hintText: "First name",
                      textCapitalization: TextCapitalization.words,
                      textController: controller.firstNameController,
                      keyboardType: TextInputType.text,
                      onChanged: (v) {
                        if (v.isNotEmpty) {
                          controller.clearErrorFirstName();
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: Text(
                      controller.errorFirstNameMessage.value,
                      style: errorTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 8, 24, 4),
                    child: CustomTextField(
                      hintText: "Last name",
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.text,
                      textController: controller.lastNameController,
                      onChanged: (v) {
                        if (v.isNotEmpty) {
                          controller.clearErrorLastName();
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: Text(
                      controller.errorLastNameMessage.value,
                      style: errorTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 8, 24, 4),
                    child: CustomTextField(
                      hintText: "Phone number",
                      keyboardType: TextInputType.number,
                      textController: controller.phoneNumberController,
                      onChanged: (v) {
                        if (v.isNotEmpty) {
                          controller.clearErrorPhoneNumber();
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: Text(
                      controller.errorPhoneNumberMessage.value,
                      style: errorTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 8, 24, 4),
                    child: CustomTextField(
                      hintText: "Password",
                      isPasswordField: true,
                      textController: controller.passwordController,
                      // suffixIcon:   unselected,
                      onChanged: (v) {
                        if (v.isNotEmpty) {
                          controller.clearErrorPassword();
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: Text(
                      controller.errorPasswordMessage.value,
                      style: errorTextStyle,
                    ),
                  ),
                  Gap(Get.height * 0.0056),
                  ConstrainedBox(
                    constraints: BoxConstraints.expand(
                        width: screenWidth(context), height: 40),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Material(
                            child: Checkbox(
                              activeColor: orange,
                              value: controller.agreementCheck.value,
                              onChanged: (value) {
                                controller.agreementCheck.value =
                                    !controller.agreementCheck.value;
                              },
                            ),
                          ),
                          SizedBox(
                            width: screenWidth(context) / 2 + 100,
                            child: const Text(
                              'By signing up you agree to Jekawin Term of Service and Privacy Policy',
                              textAlign: TextAlign.left,
                              maxLines: 2,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  height: 1.6,
                                  color: agreementColor,
                                  fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
                    child: CustomButton(
                      isLoading: controller.isLoading.value,
                      buttonText: "Sign Up",
                      onPressed: () {
                        //validate form and submit
                        controller.signUpFormValidator(key);
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
                          'Have an account?',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mulish(
                            fontSize: 12,
                            color: const Color(0xff12121D).withOpacity(.6),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.off(() => const LoginView());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'Login',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.mulish(
                                fontSize: 12,
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
