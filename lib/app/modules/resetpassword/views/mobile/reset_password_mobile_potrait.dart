import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jekawin_mobile_flutter/app/config/colors.dart';
import 'package:jekawin_mobile_flutter/app/modules/otp_reset_password/views/otp_reset_password.dart';
import 'package:jekawin_mobile_flutter/app/modules/signup_verification/views/mobile/signup_verification_mobile_portrait.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_large_button.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_text_field.dart';

import '../../../../config/themes/app_theme_constants.dart';
import '../../../../constants/asset_paths.dart';
import '../../../auth/controllers/auth_controller.dart';
import '../../../new_password/views/new_password.dart';
import '../../controllers/reset_password_controller.dart';

class ResetPasswordMobilePortrait extends GetView<ResetPasswordController> {
  @override
  final ResetPasswordController controller = Get.put(ResetPasswordController());

  ResetPasswordMobilePortrait({Key? key, this.themeData, this.customAppTheme})
      : super(key: key);
  final ThemeData? themeData;
  final CustomAppTheme? customAppTheme;

  @override
  Widget build(BuildContext context) {
    TextEditingController? phoneNumberController;

    @override
    void initState() {
      // super.initState();
      phoneNumberController = TextEditingController();
    }


    final Widget logoSvg = SvgPicture.asset(
      logoAsetName,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.150,
    );
    screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
    screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

    // return Obx(() =>
       return Scaffold(

            body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Gap(60),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Reset your Password",
                  style: TextStyle(
                      fontWeight: FontWeight.w300, // light
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                      fontSize: 24 // italic
                      ),
                )
              ],
            ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  const[
                        Text(
                          'Please Input your phone number to receive OTP',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: agreementColor, fontSize: 10),
                        ),
                    ],),
                ),

            const Padding(
                padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
                child: CustomTextField(
                  hintText: "Phone number",
                  keyboardType: TextInputType.number,
                  errorText: "Phone number invalid",
                )),

                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 4, 24, 10),
                  child: CustomButton(
                      buttonText: "Send",
                      onPressed: () =>Get.to(()=>const OtpResetPasswordView())
                      // onPressed: () =>Get.to(()=>const UpdatePasswordView( ))
                      ),
                )
          ]),
        )
        // )
    );
  }

}
