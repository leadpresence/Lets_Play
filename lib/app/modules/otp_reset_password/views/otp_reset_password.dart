import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/otp_reset_password/views/mobile/otp_password_reset_mobile_portrait.dart';
import 'package:jekawin_mobile_flutter/app/modules/otp_reset_password/views/tablet/otp_reset_password_tablet_landscape.dart';
import 'package:jekawin_mobile_flutter/app/modules/otp_reset_password/views/tablet/otp_reset_password_tablet_portrait.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'mobile/otp_password_reset_mobile_landscape.dart';



class OtpResetPasswordView extends GetView {
  final phoneNumber;
  const OtpResetPasswordView({Key? key, this.phoneNumber}) : super(key: key);


  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (_) => OrientationLayoutBuilder(

          portrait: (_)=>  OtpPasswordResetMP(key:key,phonenumber: phoneNumber,),
          landscape: (_)=> OtpPasswordResetML(key:key, ),
        ),
        tablet: (_) => OrientationLayoutBuilder(
          portrait: (_) =>    OtpResetPasswordTP(key:key,),
          landscape: (_)=>
              OtpResetPasswordTL(key:key, ),

        ));
  }
}

