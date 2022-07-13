import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/reward_points/controllers/input_transaction_pin_controller.dart';
import 'package:pinput/pinput.dart';

import '../../../../widgets/custom_large_button.dart';
import '../../../e_shop/views/mobile/success_or_failure_mobile_view.dart';
import '../../../jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';

class InputTransactionPinMobilePortrait extends StatelessWidget {
  InputTransactionPinMobilePortrait({Key? key}) : super(key: key);

  final InputTransactionPinController itpc =
      Get.put(InputTransactionPinController());

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
      body: SingleChildScrollView(
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
                controller: itpc.transactionPinController,
                focusNode: itpc.transactionPinFocusNode,
                androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsRetrieverApi,
                defaultPinTheme: itpc.defaultPinTheme,
                validator: (value) {
                  return value == '1234' ? null : 'Pin is incorrect';
                },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: debugPrint,
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22,
                      height: 1,
                      color: itpc.focusedBorderColor,
                    ),
                  ],
                ),
                focusedPinTheme: itpc.defaultPinTheme.copyWith(
                  decoration: itpc.defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: itpc.focusedBorderColor),
                  ),
                ),
                submittedPinTheme: itpc.defaultPinTheme.copyWith(
                  decoration: itpc.defaultPinTheme.decoration!.copyWith(
                    color: itpc.fillColor,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: itpc.focusedBorderColor),
                  ),
                ),
                errorPinTheme: itpc.defaultPinTheme.copyBorderWith(
                  border: Border.all(color: Colors.redAccent),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              CustomButton(
                buttonText: "Enter",
                onPressed: () => Get.to(
                  () => SuccessOrFailureMobileView(
                    msg: 'You have successfully shared 0 RPT',
                    className: JekawinBottomTabs(
                      tabIndex: 4,
                    ),
                  ),
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
