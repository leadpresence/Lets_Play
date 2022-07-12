import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_large_button.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_otp_field.dart';
import '../../../../widgets/count_down.dart';
import '../../../resetpassword/controllers/reset_password_controller.dart';
import '../../controllers/otp_reset_password_controller.dart';

class OtpPasswordResetMP extends GetView<OtpResetPasswordController> {
  final String phoneNumber;

  OtpPasswordResetMP({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  final OtpResetPasswordController controller =
      Get.put(OtpResetPasswordController());
  final ResetPasswordController resetPasswordController =
      Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
          child: Column(
            children: [
              OtpHeader(
                key: key,
                phoneNumber: phoneNumber,
              ),
              CustomOtpField(
                key: key,
                pinController: controller.otpController,
                onComplete: () {
                  controller.setOtp(controller.otpController.text);
                },
              ),
              const Gap(48),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: CustomButton(
                  hasIcon: false,
                  buttonText: 'Submit',
                  onPressed: () {
                    controller.verifyResetPasswordOtp(key);
                  },
                ),
              ),
              const Gap(16),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 8.0,
                ),
                width: Get.width,
                child: Countdown(
                  onPressed: () => {
                    resetPasswordController.resendRequestForgotPasswordOtp(key),
                    controller.startTimer(),
                  },
                  animation: StepTween(
                    begin: 300,
                    end: 0,
                  ).animate(controller.animationController.value),
                ),
              ),
              const Gap(12),
            ],
          ),
        ),
      ),
    );
  }
}

class OtpHeader extends StatelessWidget {
  final String phoneNumber;
  const OtpHeader({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Password reset',
          style: GoogleFonts.mulish(
              fontWeight: FontWeight.normal, // light
              fontStyle: FontStyle.normal,
              color: Colors.black,
              fontSize: 24 // italic
              ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          width: Get.width,
          child: Align(
            alignment: Alignment.center,
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  'Please enter ',
                  style: GoogleFonts.mulish(
                    fontSize: 12,
                    height: 1.6,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xff12121D).withOpacity(.6),
                  ),
                ),
                Text(
                  'the 4-digit ',
                  style: GoogleFonts.mulish(
                    fontSize: 12,
                    height: 1.6,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xff12121D).withOpacity(.6),
                  ),
                ),
                Text(
                  'code sent to ',
                  style: GoogleFonts.mulish(
                    fontSize: 12,
                    height: 1.6,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xff12121D).withOpacity(.6),
                  ),
                ),
                Text(
                  'you ',
                  style: GoogleFonts.mulish(
                    fontSize: 12,
                    height: 1.6,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xff12121D).withOpacity(.6),
                  ),
                ),
                Text(
                  'at ',
                  style: GoogleFonts.mulish(
                    fontSize: 12,
                    height: 1.6,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xff12121D).withOpacity(.6),
                  ),
                ),
                Text(
                  phoneNumber,
                  style: GoogleFonts.mulish(
                    fontSize: 12,
                    // fontWeight: FontWeight.bold,
                    height: 1.6,
                    color: Colors.deepOrange,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Gap(32),
      ],
    );
  }
}
