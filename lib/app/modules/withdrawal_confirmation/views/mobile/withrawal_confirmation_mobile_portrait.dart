import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/withdrawal_confirmation/controllers/withrawal_confirmation_controllers.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_otp_field.dart';
import '../../../../constants/asset_paths.dart';
import '../../../../widgets/custom_large_button.dart';
import '../../../e_shop/views/mobile/success_or_failure_mobile_view.dart';
import '../../../jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';

class WithdrawalConfirmationMobilePortrait
    extends GetView<WithdrawalConfirmationController> {
  @override
  final WithdrawalConfirmationController controller =
      Get.put(WithdrawalConfirmationController());
  WithdrawalConfirmationMobilePortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // Obx(() =>
        Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 64, 24, 24),
        child: Column(
          children: [
            const Gap(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "Available balance: ",
                  style: TextStyle(
                      fontWeight: FontWeight.w300, // light
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                      fontSize: 16 // italic
                      ),
                ),
                Gap(10),
                Text(
                  "200,000.00",
                  style: TextStyle(
                      fontWeight: FontWeight.w800, // light
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                      fontSize: 16 // italic
                      ),
                )
              ],
            ),
            const Gap(10),
            withdrawalDetails(context, "200000000000", "Chi FelixChi ", "GTB"),
            const Gap(40),
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
              pinController: controller.pinController,
              key: key,
              onComplete: () {
                // controller.setOtp(controller.signUpOtpController.text);
              },
            ),
            const Gap(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Enter one time password to continue withdrawal request.",
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
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: CustomButton(
                hasIcon: false,
                buttonText: 'Confirm withdrawal',
                onPressed: () {
                  Get.to(
                    () => const SuccessOrFailureMobileView(
                      msg:
                          "Thanks for using this service\nWithdrawal request is been processed",
                      className: JekawinBottomTabs(
                        tabIndex: 2,
                      ),
                    ),
                    transition: Transition.cupertino,
                  );
                },
              ),
            ),
            const Gap(10),
            Obx(() => SizedBox(
                  child: controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: Colors.orange,
                        ))
                      : Container(),
                ))
          ],
        ),
      ),
    );
  }

  Widget withdrawalDetails(
    BuildContext context,
    String? amount,
    String? accountName,
    String? bankName,
  ) {
    screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
    screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
    final Widget bankIcon = SvgPicture.asset(
      bank,
      width: 30,
      height: 30,
    );
    return Container(
      padding: const EdgeInsets.all(10),
      height: screenHeight(context) / 9,
      width: screenWidth(context),
      // margin: const EdgeInsets.fromLTRB(8, 9, 8, 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFE7A01).withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //bank name
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: const Text(
                    "Withdrawal Amount",
                    style: TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                  width: screenWidth(context) / 3,
                ),
                const Gap(50),
                Expanded(
                  child: SizedBox(
                    child: Text(
                      amount ?? " 0.0",
                      // style: TextStyle(fontSize: 12),

                      overflow: TextOverflow.ellipsis,
                    ),
                    width: screenWidth(context) / 3,
                  ),
                ),
              ]),
          const Gap(8),
          // account number
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: const Text(
                    "Bank Name",
                    style: TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                  width: screenWidth(context) / 3,
                ),
                const Gap(50),
                Expanded(
                  child: SizedBox(
                    child: Text(
                      bankName ?? " ",
                      // style: TextStyle(fontSize: 12),

                      overflow: TextOverflow.ellipsis,
                    ),
                    width: screenWidth(context) / 3,
                  ),
                ),
              ]),
          const Gap(8),
          // Name
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  child: const Text(
                    "Account Name",
                    style: TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                  width: screenWidth(context) / 3,
                ),
                const Gap(50),
                Expanded(
                    child: SizedBox(
                  child: Text(
                    accountName ?? " ",
                    // style: TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                  width: screenWidth(context) / 3,
                )),
              ])
        ],
      ),
    );
  }
}
