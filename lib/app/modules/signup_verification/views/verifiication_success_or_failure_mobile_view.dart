import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_large_button.dart';

class VerificationSuccessOrFailureMobileView extends StatelessWidget {
  const VerificationSuccessOrFailureMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/svgs/success_check.svg'),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Your verification was successful',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF4E4B66),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                ),
                child: CustomButton(
                  onPressed: () => Get.to(
                    () => const JekawinBottomTabs(
                      tabIndex: 3,
                    ),
                    transition: Transition.cupertino,
                  ),
                  buttonText: 'Done',
                ),
              )
            ]),
      ),
    );
  }
}
