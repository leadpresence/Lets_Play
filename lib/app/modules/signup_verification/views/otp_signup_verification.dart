import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/signup_verification/views/mobile/signup_verification_mobile_landscape.dart';
import 'package:jekawin_mobile_flutter/app/modules/signup_verification/views/mobile/signup_verification_mobile_portrait.dart';
import 'package:jekawin_mobile_flutter/app/modules/signup_verification/views/tablet/signup_verification_tablet_landscape.dart';
import 'package:jekawin_mobile_flutter/app/modules/signup_verification/views/tablet/signup_verification_tablet_portrait.dart';
import 'package:responsive_builder/responsive_builder.dart';
/**
 * this class is used to receieve otp for sign up verification
 */

class OtpSignUpVerificationView extends GetView {
  final phoneNumber;
  const OtpSignUpVerificationView({Key? key, this.phoneNumber}) : super(key: key);


  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (_) => OrientationLayoutBuilder(

          portrait: (_)=>  SignupVerificationMP(key:key,phonenumber: phoneNumber,),
          landscape: (_)=>const SignupVerificationML(),
        ),
        tablet: (_) => OrientationLayoutBuilder(
          portrait: (_) => const   SignupVerificationTP(),
          landscape: (_)=>
          const SignupVerificationTL(),

        ));
  }
}
