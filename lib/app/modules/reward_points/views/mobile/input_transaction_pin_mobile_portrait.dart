import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../../widgets/custom_large_button.dart';
import '../../controllers/reward_points_controller.dart';

class InputTransactionPinMobilePortrait extends StatelessWidget {
  InputTransactionPinMobilePortrait({Key? key}) : super(key: key);

  final RewardPointsController controller = Get.put(RewardPointsController());

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
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Input your\ntransaction pin',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff414249),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 60,
                ),
                Pinput(
                  showCursor: false,
                  controller: controller.transactionPinController,
                  focusNode: controller.transactionPinFocusNode,
                  androidSmsAutofillMethod:
                      AndroidSmsAutofillMethod.smsRetrieverApi,
                  defaultPinTheme: controller.defaultPinTheme,
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: debugPrint,
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 9),
                        width: 22,
                        height: 1,
                        color: controller.focusedBorderColor,
                      ),
                    ],
                  ),
                  focusedPinTheme: controller.defaultPinTheme.copyWith(
                    decoration: controller.defaultPinTheme.decoration!.copyWith(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: controller.focusedBorderColor),
                    ),
                  ),
                  submittedPinTheme: controller.defaultPinTheme.copyWith(
                    decoration: controller.defaultPinTheme.decoration!.copyWith(
                      color: controller.fillColor,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: controller.focusedBorderColor),
                    ),
                  ),
                  errorPinTheme: controller.defaultPinTheme.copyBorderWith(
                    border: Border.all(color: Colors.redAccent),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(
                    controller.pinError.value == '' ? 0 : 16.0,
                  ),
                  child: Text(
                    controller.pinError.value,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.normal,
                      letterSpacing: .2,
                      height: controller.pinError.value == '' ? 0 : 1,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomButton(
                  isLoading: controller.isLoading.value,
                  buttonText: "Enter",
                  onPressed: () => controller.pinValidation(key),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
