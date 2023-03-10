import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/fund_wallet/views/fund_wallet_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/wallet_home/models/user_wallet_response.dart';
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
    const TextStyle walletTextStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            left: 18.0,
            right: 18.0,
            top: 18.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width,
                child: const Center(
                  child: Text(
                    'Wallet',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff414249),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              FutureBuilder<UserWalletModel?>(
                  future: controller.getWalletAsync(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Container(
                        padding: const EdgeInsets.only(
                          top: 24,
                          bottom: 12,
                          left: 16,
                          right: 16,
                        ),
                        width: Get.width,
                        height: Get.height < 700
                            ? Get.height * .23
                            : Get.height * .19,
                        decoration: BoxDecoration(
                          color: const Color(0XFF543884),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  'Wallet Balance: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "??? " + "N/A",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Reward points: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                                Text(
                                  "N/A",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomMediumButton(
                                  onPressed: () {
                                    BotToast.showText(
                                        text:
                                            "We are unable to get wallet details, try again");
                                  },
                                  width: Get.width * .38,
                                  fontSize: 12.0,
                                  buttonText: 'Fund wallet',
                                  buttonColor: Colors.white,
                                  buttonTextColor: const Color(0xff414249),
                                ),
                                const SizedBox(width: 12),
                                CustomMediumButton(
                                  onPressed: () {
                                    BotToast.showText(
                                        text:
                                            "We are unable to get wallet details, try again");
                                  },
                                  width: Get.width * .38,
                                  fontSize: 12.0,
                                  buttonText: 'Withdraw',
                                  buttonColor: Colors.white,
                                  buttonTextColor: const Color(0xff414249),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    } else if (snapshot.hasData) {
                      UserWalletModel? walletData = snapshot.data;
                      if (walletData != null) {
                        return Container(
                          padding: const EdgeInsets.only(
                            top: 18,
                            bottom: 12,
                            left: 16,
                            right: 16,
                          ),
                          width: Get.width,
                          height: Get.height < 700
                              ? Get.height * .23
                              : Get.height * .19,
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
                                  Text(
                                    "???" +
                                        walletData.body.wallet.balance
                                            .toString(),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
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
                                  Text(
                                    // "90",
                                    walletData.body.rewardPoint.toString(),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomMediumButton(
                                    onPressed: () {
                                      Get.to(
                                        () => const FundWalletView(),
                                        transition: Transition.cupertino,
                                      );
                                    },
                                    width: Get.width * .38,
                                    fontSize: 12.0,
                                    buttonText: 'Fund wallet',
                                    buttonColor: Colors.white,
                                    buttonTextColor: const Color(0xff414249),
                                  ),
                                  const SizedBox(width: 12),
                                  CustomMediumButton(
                                    onPressed: () {
                                      Get.to(
                                        () => const SelectBankView(),
                                        transition: Transition.cupertino,
                                      );
                                    },
                                    width: Get.width * .38,
                                    fontSize: 12.0,
                                    buttonText: 'Withdraw',
                                    buttonColor: Colors.white,
                                    buttonTextColor: const Color(0xff414249),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }
                    }
                    return Container(
                      padding: const EdgeInsets.only(
                        top: 18,
                        bottom: 12,
                        left: 16,
                        right: 16,
                      ),
                      width: Get.width,
                      height: Get.height < 700
                          ? Get.height * .23
                          : Get.height * .19,
                      decoration: BoxDecoration(
                        color: const Color(0XFF543884),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Center(
                            child: CupertinoActivityIndicator(
                              radius: 12.0,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomMediumButton(
                                onPressed: () {
                                  BotToast.showText(
                                      text:
                                          "We are unable to get wallet details, try again");
                                },
                                width: Get.width * .38,
                                fontSize: 12.0,
                                buttonText: 'Fund wallet',
                                buttonColor: Colors.white,
                                buttonTextColor: const Color(0xff414249),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              CustomMediumButton(
                                onPressed: () {
                                  BotToast.showText(
                                      text:
                                          "We are unable to get wallet details, try again");
                                },
                                width: Get.width * .38,
                                fontSize: 12.0,
                                buttonText: 'Withdraw',
                                buttonColor: Colors.white,
                                buttonTextColor: const Color(0xff414249),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
              const Gap(24),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Transactions",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff414249),
                  ),
                ),
              ),
              FutureBuilder<List<TransactionsModel>>(
                future: controller.getUserTransactions(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    Center(
                      child: SizedBox(
                        width: Get.width,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 150.0,
                          ),
                          child: Text(
                            snapshot.error.toString(),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    List<TransactionsModel>? listOftrxns = snapshot.data;
                    if (listOftrxns != null) {
                      if (listOftrxns.length > 1) {
                        return Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: listOftrxns.length,
                            itemBuilder: (BuildContext context, int position) {
                              return transactionItem(
                                listOftrxns[position],
                              );
                            },
                          ),
                        );
                      }
                      return Center(
                        child: SizedBox(
                          width: Get.width,
                          child: const Padding(
                            padding: EdgeInsets.only(
                              top: 150.0,
                            ),
                            child: Text(
                              "No Transaction History",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 24,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    }
                  }
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 32.0),
                      child: CupertinoActivityIndicator(
                        // strokeWidth: 1,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
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
                offset: const Offset(0, 10),
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
                  trxnItem.transactionType == 'C' ? creditIcon : debitIcon,
                  Text(
                    trxnItem.createdAt.toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const Gap(10),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    trxnItem.transactionType == 'C' ? "Credit" : "Debit",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    trxnItem.currency + " " + trxnItem.amount.toString(),
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
