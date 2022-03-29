import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_large_button.dart';

import '../../../../config/routes/app_pages.dart';
import '../../controllers/auth_controller.dart';

class AuthHomeMobileLandscape extends GetView<AuthHomeController> {
  const AuthHomeMobileLandscape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/images/jekawin_auth_home.svg';
    const String logoAsetName = 'assets/images/jekawin_logo.svg';

    final Widget topSvg = SvgPicture.asset(
      assetName,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.40,
    );

    final Widget logoSvg = SvgPicture.asset(
      logoAsetName,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.80,
    );
    return Obx(
      () => Scaffold(
          body: SingleChildScrollView(
              child: Column(
                  children: [
            topSvg,
            const Gap(60),
            logoSvg,
            const Gap(40),
            orangeLageButton("Sign Up", ()=>Get.toNamed(Routes.eShop), context),
            const Gap(10),
            purpleLageButton("Sign Up",  ()=>Get.toNamed(Routes.eShop), context)
          ]))),
    );
  }

  navigateToSigup() {}
}
