import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jekawin_mobile_flutter/app/modules/signup_verification/controllers/signup_verification_controller.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_large_button.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_otp_field.dart';

import '../../../../config/colors.dart';
import '../../../jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';

class SignupVerificationMP extends GetView<SignUpVerificationController> {

  const SignupVerificationMP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

      Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 64, 24, 24),
          child: Column(
            children: [
            OtpHeader(key: key,),
          CustomOtpField(key: key, onComplete: () {},),
          const Gap(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Resend',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                  color: purpleDark,
                ),
              ),
            ],
          ),
          const Gap(25),
          CustomButton(key: key, onPressed: () =>
              Get.to(() =>
              const JekawinBottomTabs(
                tabIndex: 0,
              )), buttonText: "Submit",)
        ],
      ),)
    ,
    );
  }
}


class OtpHeader extends StatelessWidget {
  const OtpHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Phone Verification',
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
              '09087564312',
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
