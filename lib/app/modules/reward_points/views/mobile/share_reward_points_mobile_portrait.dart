import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/reward_points/views/mobile/input_transaction_pin_mobile_portrait.dart';

import '../../../../widgets/custom_large_button.dart';
import '../../../../widgets/custom_text_field.dart';

class ShareRewardPointsMobilePortrait extends StatelessWidget {
  const ShareRewardPointsMobilePortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Share Reward Points',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff414249),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              const CustomTextField(
                hintText: "Amount of points",
              ),
              const SizedBox(
                height: 24,
              ),
              const CustomTextField(
                hintText: "Receiver's phone Number",
              ),
              const SizedBox(
                height: 32,
              ),
              CustomButton(
                buttonText: "Send",
                onPressed: () => Get.to(
                  () => InputTransactionPinMobilePortrait(),
                  transition: Transition.cupertino,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
