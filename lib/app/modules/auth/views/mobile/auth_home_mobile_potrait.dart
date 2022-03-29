import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jekawin_mobile_flutter/app/config/routes/app_pages.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/views/e_shop_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/signup/views/sign_up.dart';
import 'package:jekawin_mobile_flutter/app/modules/splash/views/splash_view.dart';
import '../../../../config/colors.dart';
import '../../../../constants/asset_paths.dart';
import '../../../../widgets/custom_large_button.dart';
import '../../controllers/auth_controller.dart';

class AuthHomeMobilePotriat extends GetView<AuthHomeController> {
  const AuthHomeMobilePotriat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/images/jekawin_auth_home.svg';
    screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

    final Widget topSvg = SvgPicture.asset(
      assetName,
      // width: MediaQuery.of(context).size.width,
    );

    final Widget logoSvg = SvgPicture.asset(
      logoAsetName,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.150,
    );
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      topSvg,
      const Gap(2),
      logoSvg,
      const Gap(40),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            CustomButton(
              buttonText: 'Sign Up',
              hasIcon: false,
              onPressed: () {
                Get.to(() => const SignUpView());
              },
            ),
            const Gap(12),
            CustomButton(
              buttonText: 'Log In',
              hasIcon: false,
              onPressed: () {},
            ),
          ],
        ),
      ),
      const Gap(16),
      SizedBox(
        width: (screenWidth(context) * 0.91),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Gap(5),
            CircleButton(key: key, onTap: () {}, iconData: Icons.arrow_forward)
          ],
        ),
      )
    ]))

        // ),//obx observable

        );
  }
}

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData iconData;

  const CircleButton(
      {required Key? key, required this.onTap, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 50.0;

    return InkResponse(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          color: orange,
          shape: BoxShape.circle,
        ),
        child: Icon(
          iconData,
          color: Colors.white,
        ),
      ),
    );
  }
}
