import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/constants/asset_paths.dart';
import 'package:jekawin_mobile_flutter/app/modules/fund_wallet/controllers/fund_wallet_controller.dart';
import '../../../../config/themes/app_theme_constants.dart';
import '../../../../widgets/custom_large_button.dart';
import '../../../../widgets/custom_text_field.dart';

class FundWalletMobilePortrait extends GetView {
  @override
  final FundWalletController controller = Get.put(FundWalletController());

  FundWalletMobilePortrait({Key? key, this.themeData, this.customAppTheme})
      : super(key: key);
  final ThemeData? themeData;
  final CustomAppTheme? customAppTheme;

  @override
  Widget build(BuildContext context) {

    const TextStyle errorTextStyle = TextStyle(
      fontSize: 10,
      color: Colors.deepOrange,
      // height: 1.8,
      letterSpacing: .2,
      fontWeight: FontWeight.bold,
    );
    final Widget wallet = SvgPicture.asset(
      walletCard,
      width: MediaQuery.of(context).size.width / 16,
      height: MediaQuery.of(context).size.height * 0.110,
    );
    return Obx(() => Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: controller.fundWalletFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Fund Wallet",
                        style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontStyle: FontStyle.normal,
                            color: Colors.black,
                            fontSize: 24),
                      )
                    ],
                  ),
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [wallet],
                  ),
                  const Gap(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "A service charge of 1.4 % applies to card transactions.",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.normal,
                            color: Colors.black,
                            fontSize: 12),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
                    child: CustomTextField(
                      textController: controller.amountController,
                      hintText: "Enter Amount",
                      onChanged: (v) {
                        if (v.isNotEmpty) {}
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: Text(
                      controller.errAmountMessage.value,
                      style: errorTextStyle,
                    ),
                  ),
                  const Gap(10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 5, 24, 10),
                    child: CustomTextField(
                      textController: controller.emailController,
                      hintText: "Enter Email",
                      onChanged: (v) {
                        if (v.isNotEmpty) {}
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: Text(
                      controller.errEmailMessage.value,
                      style: errorTextStyle,
                    ),
                  ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 4, 24, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Pay With",
                          style: TextStyle(
                              fontWeight: FontWeight.w300, // light
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                              fontSize: 16 // italic
                              ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.toggle(),
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 24, top: 14, right: 24, bottom: 4),
                      padding: const EdgeInsets.all(10),
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black12.withOpacity(0.3),
                          width: .5,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Paystack",
                              style: TextStyle(color: Colors.black)),
                          controller.paystackSelected.value
                              ? const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                )
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.toggleF(),
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 24,
                        top: 14,
                        right: 24,
                        bottom: 4,
                      ),
                      padding: const EdgeInsets.all(10),
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black12.withOpacity(0.3),
                          width: .5,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Flutter Wave",
                            style: TextStyle(color: Colors.black),
                          ),
                          controller.flutterWaveSelected.value
                              ? const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                )
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ),
                  const Gap(30),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 4, 24, 10),
                    child: CustomButton(
                      buttonText: controller.buttonText.value.toString(),
                      onPressed: () {
                        if(controller.paymentLinkIsSet.isFalse){
                          controller.fundFormValidator();
                        }
                        else{
                          controller.navigateTWebView();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class PaymentProvider {}
