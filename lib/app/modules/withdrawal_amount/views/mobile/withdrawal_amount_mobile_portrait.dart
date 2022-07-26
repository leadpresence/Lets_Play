import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/select_account/models/bank_model.dart';
import 'package:jekawin_mobile_flutter/app/modules/select_account/views/mobile/select_bank_mobile_portrait.dart';
import 'package:jekawin_mobile_flutter/app/modules/withdrawal_amount/controllers/withdrawal_amount_controller.dart';

import '../../../../widgets/custom_large_button.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../wallet_home/models/user_wallet_response.dart';

class WithdrawalAmountMobilePortrait
    extends GetView<WithdrawalAmountController> {

  @override
  final WithdrawalAmountController controller = Get.put(WithdrawalAmountController());
  @override
  Widget build(BuildContext context) {

    const TextStyle errorTextStyle =
    TextStyle(fontSize: 8, color: Colors.deepOrange);
    return

      Obx(()=>Scaffold(
        body: SingleChildScrollView(
            child: Form(
                key: controller.addAmountFormKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(100),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(20, 4, 20, 10),

                   child: BankItem(showBin: false,bankItem: BankResponse(accountNumber: "",bankCode: "",bankName: "",),),
                 ),

                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          GestureDetector(
                            onTap: (){},
                            child: const Text(
                              "Use another account",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, // light
                                  fontStyle: FontStyle.normal,
                                  color: Colors.orange,
                                  fontSize: 11 // italic
                              ),
                            ),
                          )
                        ],
                      ),
                      const Gap(10),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(24, 40, 24, 10),
                          child: CustomTextField(
                              hintText: "Amount",
                              textController: controller.accountNumberController,
                              onChanged: (v) {
                                if (v.isNotEmpty) {
                                  controller.clearErrorAccountNumber();
                                }
                              })),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                        child: Text(
                          controller.errorAccountNumberMessage.value,
                          style: errorTextStyle,
                        ),
                      ),

                      const Gap(30),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 4, 24, 10),
                        child: CustomButton(
                            buttonText: "Continue",
                            onPressed: () {
                              //validate form and submit
                              controller.continueToNext();
                            }),
                      ),
                    ])))));
  }
}
