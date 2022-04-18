import 'package:flutter/material.dart';

// mport 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jekawin_mobile_flutter/app/config/colors.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_large_button.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_text_field.dart';

import '../../../../config/themes/app_theme_constants.dart';
import '../../../../constants/asset_paths.dart';
import '../../../auth/controllers/auth_controller.dart';
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
    final Widget logoSvg = SvgPicture.asset(
      logoAsetName,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.150,
    );
    screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
    screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

    return Obx(() => Scaffold(
            body: SingleChildScrollView(
          child: Form(
            key: controller.signUpFormKey,
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
                    hintText: "what's your preferred first name",
                    textController: controller.firstNameController,
                  )),

              Padding(
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 10),
                  child: CustomTextField(
                    hintText: "Last name",
                    textController: controller.lastNameController,
                  )),
              Padding(
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 10),
                  child: CustomTextField(
                    hintText: "Phone number 23490112344",
                    textController: controller.phoneNumberController,
                  )),

              Padding(
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 10),
                  child: CustomTextField(
                    hintText: "Password",
                    isPasswordField: true,
                    textController: controller.passwordController,
                  )),
              Gap(Get.height * 0.0056),
              SizedBox(
                width: screenWidth(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: Text(
                          'I agree to the Jekawin Term of Service and Privacy Policy',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: agreementColor, fontSize: 13),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(24, 4, 24, 10),
                child: CustomButton(
                    buttonText: "Sign Up",
                    onPressed: () {
                      //validate form and submit
                      controller.signUpFormValidator(key);
                    }),
              ),
              const Gap(10),
              SizedBox(
                child: controller.isLoading.value
                    ? const Center(child:  CircularProgressIndicator(color: Colors.orange,))
                    : Container(),
              )
            ]),
          ),
        )));
  }
}
