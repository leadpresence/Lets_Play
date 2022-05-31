import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jekawin_mobile_flutter/app/modules/pin/controllers/set_pin_controllers.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_large_button.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_otp_field.dart';

import '../../../widgets/count_down.dart';
import '../../dashboard/views/mobile/dashboard_mobile_portrait.dart';
import '../../e_shop/views/mobile/success_or_failure_mobile_view.dart';
import '../../login/views/login.dart';
import '../../user_profile/views/mobile/user_profile_mobile_portrait.dart';
import '../../user_profile/views/user_profile_view.dart';

class SetPinMobilePortrait extends GetView<SetPinController> {
  String phoneNumber = GetStorage().read('phoneNumber');

  SetPinMobilePortrait({Key? key}) : super(key: key);

  @override
  final SetPinController resetPasswordController =
  Get.put(SetPinController());

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
              const Gap(18),

              Text(
                'Pin Code',
                textAlign: TextAlign.left,
                style: GoogleFonts.mulish(
                    fontWeight: FontWeight.normal, // light
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                    fontSize: 16 // italic
                ),
              ),
              const Gap(10),

              CustomOtpField(
                key: key,
                pinController: controller.pinController,
                onComplete: () {},
              ),
              const Gap(18),

              Text(
                'Confirm Pin Code',
                style: GoogleFonts.mulish(
                    fontWeight: FontWeight.normal, // light
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                    fontSize: 16 // italic
                ),
              ),
              const Gap(10),
              CustomOtpField(
                key: key,
                pinController: controller.confirmPinController,
                onComplete: () {},
              ),
              const Gap(48),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: CustomButton(
                  hasIcon: false,
                  buttonText: 'Submit',
                  onPressed: () {

                    Get.to(
                          () => const SuccessOrFailureMobileView(
                        msg: "Transaction pin set successful",
                        className: UserProfileView(),),
                      transition: Transition.cupertino,
                    );
                  },
                ),
              ),
              const Gap(16),

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
          'Set your transaction pin',
          style: GoogleFonts.mulish(
              fontWeight: FontWeight.normal, // light
              fontStyle: FontStyle.normal,
              color: Colors.black,
              fontSize: 24 // italic
          ),
        ), //Pin Code
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
                  'To set up your pin, create a 5 digit code then  ',
                  style: GoogleFonts.mulish(
                    fontSize: 12,
                    height: 1.6,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xff12121D).withOpacity(.6),
                  ),
                ),
                Text(
                  'confirm it below ',
                  style: GoogleFonts.mulish(
                    fontSize: 12,
                    height: 1.6,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xff12121D).withOpacity(.6),
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
