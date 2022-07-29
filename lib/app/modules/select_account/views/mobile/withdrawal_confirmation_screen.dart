import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jekawin_mobile_flutter/app/modules/select_account/views/mobile/select_bank_mobile_portrait.dart';

import '../../../../config/themes/app_theme_constants.dart';
import '../../../../widgets/custom_large_button.dart';
import '../../../../widgets/custom_otp_field.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../fund_wallet/views/mobile/fund_wallet_mobile_portrait.dart';
import '../../../wallet_home/models/user_wallet_response.dart';
import '../../controller/select_bank_controller.dart';
import '../../models/bank_model.dart';

class WithdrawalConfirmation extends StatelessWidget {
  @override
  final SelectBankController controller = Get.put(SelectBankController());

  WithdrawalConfirmation({Key? key, this.themeData, this.customAppTheme})
      : super(key: key);

  final ThemeData? themeData;
  final CustomAppTheme? customAppTheme;

  @override
  Widget build(BuildContext context) {
    BankResponse account = controller.utilsProvider.withdrawalAccount.value[0];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            splashRadius: 24,
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
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            top: 12.0,
          ),
          child: Column(
            children: [
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Available Balance: ₦ ${controller.balance.value.toString()}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, // light
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                        fontSize: 13 // italic
                        ),
                  )
                ],
              ),
              BankItem(showBin: false, bankItem: account),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "A service charge of 1.4 % applies to card transactions.",
                    style: TextStyle(
                        fontWeight: FontWeight.w300, // light
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                        fontSize: 11 // italic
                        ),
                  )
                ],
              ),
              const Gap(40),
              CustomOtpField(
                obscureText: true,

                pinController: controller.pinController,
                key: key,
                onComplete: () {
                  controller.clearErrorPin();
                },
              ),
              Obx(() => Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: Text(
                      controller.errorPinMessage.value,
                      style: errorTextStyle,
                    ),
                  )),
              const Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Enter your transaction pin to continue withdrawal request.",
                    style: TextStyle(
                        fontWeight: FontWeight.w300, // light
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                        fontSize: 11 // italic
                        ),
                  )
                ],
              ),
              const Gap(25),
              Obx(() => Padding(
                    padding: const EdgeInsets.fromLTRB(24, 4, 24, 10),
                    child: CustomButton(
                      isLoading: controller.isLoading.value,
                      buttonText: "Continue",
                      onPressed: () {
                        controller.pinFormValidator();
                      },
                    ),
                  )),
              const Gap(40),
            ],
          ),
        ),
      ),
    );
  }
}
