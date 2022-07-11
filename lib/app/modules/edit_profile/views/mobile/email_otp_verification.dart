import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jekawin_mobile_flutter/app/modules/signup/controllers/sign_up_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/signup_verification/controllers/signup_verification_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/user_profile/views/user_profile_view.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_large_button.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_otp_field.dart';
import '../../../../widgets/count_down.dart';
import '../../../e_shop/views/mobile/success_or_failure_mobile_view.dart';
import '../../../jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';

class EmailOTPVerification extends GetView<SignUpVerificationController> {
  @override
  final SignUpVerificationController controller =
      Get.put(SignUpVerificationController());
  final SignUpController signUpController = Get.put(SignUpController());
  final String email;

  EmailOTPVerification({
    Key? key,
    required this.email,
  }) : super(key: key);

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
      body: Obx(
        () => SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
            child: Column(
              children: [
                OtpHeader(
                  key: key,
                  email: email,
                ),
                CustomOtpField(
                  pinController: controller.signUpOtpController,
                  key: key,
                  onComplete: () {
                    // controller.setOtp(controller.signUpOtpController.text);
                  },
                ),
                const Gap(48),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CustomButton(
                    isLoading: controller.isLoading.value,
                    hasIcon: false,
                    buttonText: 'Submit',
                    onPressed: () => Get.to(
                      () => SuccessOrFailureMobileView(
                        msg: 'Profile update successful',
                        className: UserProfileView(),
                      ),
                    ),
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
                      signUpController.resendSignUp(key),
                      controller.startTimer(),
                    },
                    animation: StepTween(
                      begin: 120,
                      end: 0,
                    ).animate(
                      controller.animationController.value,
                    ),
                  ),
                ),
                const Gap(12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OtpHeader extends StatelessWidget {
  final String email;
  const OtpHeader({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Verify Email',
          style: GoogleFonts.mulish(
              fontWeight: FontWeight.normal,
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
                  email,
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
