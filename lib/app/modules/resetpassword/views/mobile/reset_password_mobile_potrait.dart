import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jekawin_mobile_flutter/app/modules/otp_reset_password/views/otp_reset_password.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_large_button.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_text_field.dart';
import '../../../../config/themes/app_theme_constants.dart';
import '../../../../constants/asset_paths.dart';
import '../../controllers/reset_password_controller.dart';

class ResetPasswordMobilePortrait extends GetView<ResetPasswordController> {
  @override
  ResetPasswordMobilePortrait({Key? key, this.themeData, this.customAppTheme})
      : super(key: key);
  final ThemeData? themeData;
  final CustomAppTheme? customAppTheme;

  @override
  final ResetPasswordController controller = Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    TextEditingController? phoneNumberController;

    const TextStyle errorTextStyle = TextStyle(
      fontSize: 10,
      color: Colors.deepOrange,
      letterSpacing: .2,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            splashRadius: 25,
            icon: SvgPicture.asset(
              'assets/svgs/chevronLeft.svg',
              color: const Color(0xff12121D),
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ),
      body: Obx(
        () => SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Reset your Password",
                      style: GoogleFonts.mulish(
                          fontWeight: FontWeight.normal, // light
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                          fontSize: 24 // italic
                          ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Please Input your phone number to receive OTP',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.mulish(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          height: 1.6,
                          color: const Color(0xff12121D).withOpacity(.6),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 4),
                  child: CustomTextField(
                    hintText: "Phone number",
                    keyboardType: TextInputType.number,
                    textController: controller.phoneNumberController,
                    onChanged: (v) {
                      if (v.isNotEmpty) controller.clearErrorPhoneNumber();
                    },
                    // errorText: "Phone number invalid",
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
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                  child: CustomButton(
                      isLoading: controller.isLoading.value,
                      buttonText: "Send",
                      onPressed: () =>
                          controller.resetPasswordFormValidator(key)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
