import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/config/colors.dart';
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
      fontSize: 8,
      color: Colors.deepOrange,
    );
    final Widget logoSvg = SvgPicture.asset(
      logoAsetName,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.150,
    );
    screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
    screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

    return Obx(
      () => Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: controller.signUpFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [logoSvg],
                ),
                const Gap(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Sign up",
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
                  padding: const EdgeInsets.fromLTRB(24, 40, 24, 10),
                  child: CustomTextField(
                    hintText: "First name",
                    textController: controller.firstNameController,
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
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 10),
                  child: CustomTextField(
                    hintText: "Last name",
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
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 10),
                  child: CustomTextField(
                    hintText: "Phone number ",
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
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 10),
                  child: CustomTextField(
                    hintText: "Password",
                    isPasswordField: true,
                    textController: controller.passwordController,
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
                ConstrainedBox(
                  constraints: BoxConstraints.expand(
                      width: screenWidth(context), height: 40),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
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
                            'By signing up you agree to Jekawin Term of Service and \nPrivacy Policy',
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(color: agreementColor, fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 32, 24, 10),
                  child: CustomButton(
                    buttonText: "Sign Up",
                    onPressed: () {
                      //validate form and submit
                      controller.signUpFormValidator(key);
                    },
                  ),
                ),
                const Gap(10),
                SizedBox(
                  child: controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: Colors.orange,
                        ))
                      : Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
