import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/fund_wallet/views/fund_wallet_view.dart';
import 'package:jekawin_mobile_flutter/app/utils/helpers/text_helper.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_small_button.dart';

import '../../../../config/themes/app_theme_constants.dart';
import '../../../../constants/asset_paths.dart';
import '../../../../widgets/custom_medium_button.dart';
import '../../../select_account/views/select_bank_view.dart';
import '../../controllers/wallet_home_controller.dart';
import '../../models/transaction_model.dart';

class WalletHomeMobilePortrait extends GetView<WalletHomeController> {
  @override
  final WalletHomeController controller = Get.put(WalletHomeController());

  WalletHomeMobilePortrait({Key? key, this.themeData, this.customAppTheme})
      : super(key: key);
  final ThemeData? themeData;
  final CustomAppTheme? customAppTheme;

  @override
  Widget build(BuildContext context) {
    var balance = controller.balance.toString();
    var rewardPoints = controller.rewardPoints.toString();

    const TextStyle walletTextStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            top: 12.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Wallet',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff414249),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 18,
                  bottom: 12,
                  left: 16,
                  right: 16,
                ),
                width: Get.width,
                height: Get.height * .19,
                decoration: BoxDecoration(
                  color: const Color(0XFF543884),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Wallet Balance: ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Obx(
                          () =>
                              Text(
                                "₦ "+controller.balance.value.toString(),
                                style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Reward points: ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Obx(() => Text(
                                // "90",
                                controller.rewardPoints.value.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomMediumButton(
                          onPressed: () {
                            Get.to(
                              () => const FundWalletView(),
                              transition: Transition.cupertino,
                            );
                          },
                          width: Get.width * .36,
                          fontSize: 12.0,
                          buttonText: 'Fund wallet',
                          buttonColor: Colors.white,
                          buttonTextColor: const Color(0xff414249),
                        ),
                        CustomMediumButton(
                          onPressed: () {
                            Get.to(
                              () => const SelectBankView(),
                              transition: Transition.cupertino,
                            );
                          },
                          width: Get.width * .36,
                          fontSize: 12.0,
                          buttonText: 'Withdraw',
                          buttonColor: Colors.white,
                          buttonTextColor: const Color(0xff414249),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Gap(20),
              const Text(
                "Transactions",
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff000000),
                ),
              ),
              controller.transactions.isNotEmpty?
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 13,
                  itemBuilder: (BuildContext context, int position) {
                    return transactionItem(
                      controller.transactions[position],
                    );
                  },
                ),
              )
                  :Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 70.0,left: 60,right: 20),
                      child: Row(children: const [
                Text("Your transaction will be displayed here",style: TextStyle(color: Colors.grey),)
              ],),
                    ),
                  ),

            ],
          ),
        ),
      ),
    );
  }

  Widget transactionItem(TransactionsModel trxnItem) {
    final Widget debitIcon = SvgPicture.asset(
      debitSvg,
      height: 24,
      width: 24,
    );

    final Widget creditIcon = SvgPicture.asset(
      creditSvg,
      height: 24,
      width: 24,
    );
    screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
    screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                spreadRadius: -12,
                offset: Offset(0, 10),
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 25,
              ),
            ],
          ),
          padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  false ? creditIcon : debitIcon,
                  Text(
                    trxnItem.createdAt.day.toString() ?? "Date",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Gap(10),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    trxnItem.transactionType == 0 ? "Credit" : "Debit",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "₦ " + trxnItem.amount.toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
