import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/select_account/views/mobile/select_bank_mobile_portrait.dart';
import 'package:jekawin_mobile_flutter/app/modules/wallet_home/models/user_wallet_response.dart';
import '../../../../config/themes/app_theme_constants.dart';
import '../../../../widgets/custom_large_button.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../../widgets/slide_in_animation.dart';
import '../../../fund_wallet/views/mobile/fund_wallet_mobile_portrait.dart';
import '../../controller/select_bank_controller.dart';

class WithdrawalAmountScreen extends StatelessWidget {
  @override
  final SelectBankController controller = Get.put(SelectBankController());

  WithdrawalAmountScreen({Key? key, this.themeData, this.customAppTheme})
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
                child: Column(children: [
                  SlideInAnimation(
                    duration: const Duration(milliseconds: 600),
                    child:  BankItem(showBin: false, bankItem: account,selectAccount: null,deleteAccount: null,),
                  ),
                  const Gap(20),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Text(
                      "Use another account",
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.0),
                    ),
                  ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
                    child:
                    SlideInAnimation(
                      duration: const Duration(milliseconds: 600),
                      child:     CustomTextField(
                        textController: controller.amountController,
                        keyboardType: TextInputType.number,
                        hintText: "Enter Amount",
                        onChanged: (v) {},
                      ),
                    ),
                  ),
                  Obx(
                   ()=> Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                      child: Text(
                        controller.errAmountMessage.value,
                        style: errorTextStyle,
                      ),
                    ),
                  ),

                  const Gap(10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 4, 24, 10),
                    child:

                    SlideInAnimation(
                      duration: const Duration(milliseconds: 600),
                      child:   CustomButton(
                        buttonText: "Continue",
                        onPressed: () {
                          controller.fundFormValidator();
                        },
                      ),
                    ),
                  ),
                ]))));
  }
}
