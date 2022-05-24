import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/constants/asset_paths.dart';
import 'package:jekawin_mobile_flutter/app/modules/fund_wallet/controllers/fund_wallet_controller.dart';

import '../../../../config/themes/app_theme_constants.dart';
import '../../../../widgets/custom_large_button.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../e_shop/views/mobile/success_or_failure_mobile_view.dart';
import '../../../jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';

class FundWalletMobilePortrait extends GetView {
  @override
  final FundWalletController controller = Get.put(FundWalletController());

  FundWalletMobilePortrait({Key? key, this.themeData, this.customAppTheme})
      : super(key: key);
  final ThemeData? themeData;
  final CustomAppTheme? customAppTheme;

  @override
  Widget build(BuildContext context) {
    final Widget wallet = SvgPicture.asset(
      walletCard,
      width: MediaQuery.of(context).size.width / 16,
      height: MediaQuery.of(context).size.height * 0.110,
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
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
                        fontSize: 11),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 40, 24, 10),
                child: CustomTextField(
                  hintText: "Enter Amount",
                  onChanged: (v) {
                    if (v.isNotEmpty) {}
                  },
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
              Obx(
                () => GestureDetector(
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
              ),
              Obx(
                () => GestureDetector(
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
                            :   const SizedBox()
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(30),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 4, 24, 10),
                child: CustomButton(
                  buttonText: "Continue",
                  onPressed: () {
                    Get.to(
                      () => const SuccessOrFailureMobileView(
                        msg: "Wallet funded successfully",
                        className: JekawinBottomTabs(
                          tabIndex: 2,
                        ),
                      ),
                      transition: Transition.cupertino,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentProvider {}
