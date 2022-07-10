import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/constants/asset_paths.dart';
import 'package:jekawin_mobile_flutter/app/modules/edit_profile/controllers/edit_profile_controllers.dart';
import 'package:jekawin_mobile_flutter/app/modules/edit_profile/views/mobile/edit_profile_mobile_porttrait.dart';
import 'package:jekawin_mobile_flutter/app/modules/fund_wallet/controllers/fund_wallet_controller.dart';
import '../../../../config/themes/app_theme_constants.dart';
import '../../../../widgets/custom_large_button.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../../widgets/fade_in_animations.dart';

const TextStyle errorTextStyle = TextStyle(
  fontSize: 10,
  color: Colors.deepOrange,
  // height: 1.8,
  letterSpacing: .2,
  fontWeight: FontWeight.bold,
);

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
    return Obx(
      () => Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: controller.fundWalletFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(50),
                Padding(
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
                const Gap(20),
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
                const Gap(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [wallet],
                ),
                const Gap(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "A service charge of 1.4 % applies\nto card transactions.",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                        fontSize: 12,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
                  child: CustomTextField(
                    textController: controller.amountController,
                    hintText: "Enter Amount",
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    onChanged: (v) {
                      if (v.isNotEmpty) {}
                      controller.clearErrorAmount();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(36, 6, 24, 6),
                  child: Text(
                    controller.errAmountMessage.value,
                    style: errorTextStyle,
                  ),
                ),
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 4, 24, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Pay With",
                        style: TextStyle(
                          fontWeight: FontWeight.normal, // light
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                          fontSize: 16, // italic
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
                                size: 18,
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
                                size: 18,
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
                    isLoading: controller.isLoading.value,
                    buttonText: controller.buttonText.value.toString(),
                    onPressed: () {
                      if (controller.paymentLinkIsSet.isFalse) {
                        // showDialogToUpdateProfile(context);
                        controller.fundFormValidator();
                      } else {
                        controller.navigateTWebView();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future showDialogToUpdateProfile(context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return FadeIn(
        duration: const Duration(milliseconds: 200),
        delay: const Duration(milliseconds: 100),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: Get.width),
            child: Container(
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 24.0,
                    offset: Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // To make the card compact
                children: [
                  const SizedBox(height: 4.0),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      top: 16.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () => Get.back(),
                          child: SvgPicture.asset(
                            'assets/svgs/cancel.svg',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          'Complete profile setup',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Verify your Email to fund your wallet and have full access to all games.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff000000),
                            height: 1.6,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  SizedBox(
                    width: Get.width * .36,
                    child: Expanded(
                      child: CustomButton(
                        height: 40.0,
                        onPressed: () {
                          Get.back();
                          Get.to(
                            () => EditProfileMobilePortrait(),
                            transition: Transition.downToUp,
                          );
                        },
                        buttonText: 'Update Profile',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
