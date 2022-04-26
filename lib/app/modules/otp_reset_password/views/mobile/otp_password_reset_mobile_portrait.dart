import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_large_button.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_otp_field.dart';

import '../../../../config/colors.dart';
import '../../../messages/views/response_message.dart';
import '../../../new_password/views/new_password.dart';
import '../../controllers/otp_reset_password_controller.dart';

class OtpPasswordResetMP extends StatelessWidget {
  final String phoneNumber;

  OtpPasswordResetMP({Key? key, required this.phoneNumber}) : super(key: key);

  final OtpResetPasswordController controller =
      Get.put(OtpResetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 64, 24, 24),
        child: Column(
          children: [
            OtpHeader(
              key: key,
              phoneNumber: phoneNumber,
            ),
            CustomOtpField(
              key: key,
              pinController: controller.otpController,
              onComplete: () {},
            ),
            const Gap(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  //Todo @felix call the resend otp end point and
                  //todo show toast
                  onTap: () {},
                  child: Text(
                    'Resend code',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      color: purpleDark,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(25),
            // CustomButton(key: key, onPressed: () =>
            //     Get.to(() =>
            //     const JekawinBottomTabs(
            //       tabIndex: 0,
            //     )), buttonText: "Submit",)

            Padding(
              padding: const EdgeInsets.all(2.0),
              child: CustomButton(
                hasIcon: false,
                buttonText: 'Submit',
                //Todo @felix validate otp and on success anvigate them to update password view
                onPressed: () => Get.to(() => const UpdatePasswordView()),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OtpHeader extends StatelessWidget {
  final phoneNumber;

  const OtpHeader({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Password reset',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
        Text(
          'Please enter the 4-digit code sent to you at',
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: const Color.fromRGBO(133, 153, 170, 1),
          ),
        ),
        const Gap(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              phoneNumber ?? '09087564312',
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.deepOrange,
              ),
            ),
          ],
        ),
        const SizedBox(height: 64)
      ],
    );
  }
}
