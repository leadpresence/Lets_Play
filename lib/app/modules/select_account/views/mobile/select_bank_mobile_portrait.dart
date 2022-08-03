import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/add_bank_acccount/views/add_bank_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/select_account/controller/select_bank_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/select_account/views/mobile/withdrawal_amount_screen.dart';
import 'package:jekawin_mobile_flutter/app/modules/wallet_home/models/user_wallet_response.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_medium_button.dart';

import '../../../../config/themes/app_theme_constants.dart';
import '../../../../constants/asset_paths.dart';
import '../../../../widgets/custom_large_button.dart';
import '../../../../widgets/slide_in_animation.dart';
import '../../models/bank_model.dart';

class SelectBankMobilePortrait extends GetView {
  @override
  final SelectBankController controller = Get.put(SelectBankController());

  SelectBankMobilePortrait({Key? key, this.themeData, this.customAppTheme})
      : super(key: key);
  final ThemeData? themeData;
  final CustomAppTheme? customAppTheme;

  @override
  Widget build(BuildContext context) {
    screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
    screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
    final Widget addBankIcon = SvgPicture.asset(
      addBank,
      width: 30,
      height: 30,
    );
    return Scaffold(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Select  Account",
                  style: TextStyle(
                      fontWeight: FontWeight.w200, // light
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                      fontSize: 24 // italic
                      ),
                )
              ],
            ),
            const Gap(30),
            //  Add new bank account
            Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                child: GestureDetector(
                  onTap: () => Get.to(() => const AddBankView()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      addBankIcon,
                      const Gap(24),
                      SizedBox(
                        child: const Text(
                          "Add new bank account",
                          overflow: TextOverflow.ellipsis,
                        ),
                        width: screenWidth(context) / 2,
                      ),
                    ],
                  ),
                )),
            const Gap(16),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                height: screenHeight(context) / 2 + 130,
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
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
                child:
    // FutureBuilder<UserWalletModel?>(
    // future: controller.getUserWallet(),
    // builder: (context, snapshot) {
    // if (snapshot.hasError) {}
    //
    // }),

                GetX<SelectBankController>(
                  builder: (controller) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.savedBanksList.value.length,
                      itemBuilder: (BuildContext context, int position) {
                        return BankItem(
                            showBin: true,
                            selectAccount: () {
                              controller.setWithdrawalAccount(
                                controller.savedBanksList.value[position],
                              );
                              Get.to(() => WithdrawalAmountScreen());
                            },
                            bankItem: controller.savedBanksList.value[position],
                            deleteAccount: () {
                              controller.setDeletableAccount(
                                  controller.savedBanksList.value[position],
                                  context);
                              showAlert(context);
                            });
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Delete Saved Account"),
            content: const Text(
                "You will delete this account from the list of your withdrawal accounts"),
            actions: [
              OutlinedButton(
                  onPressed: () {
                    controller.deleteBanksList.value.clear();
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel")),
              ElevatedButton(
                style:  ElevatedButton.styleFrom(
          primary: Colors.orange
          ),
                  onPressed: () {
                    controller.deleteSavedAccount(context);
                  },
                  child: const Text("Continue"))
            ],
          );
        });
  }
}

//Todo @felix create needed para meters for this class
class BankItem extends StatelessWidget {
  final deleteAccount, selectAccount, showBin;
  final BankResponse bankItem;

  const BankItem(
      {Key? key,
      this.showBin = false,
      required this.bankItem,
      this.deleteAccount,
      this.selectAccount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

    final Widget binIcon = SvgPicture.asset(
      bin,
    );
    final Widget bankIcon = SvgPicture.asset(
      bank,
    );

    return Container(
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFE7A01).withOpacity(.06),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: selectAccount,
            child: Row(
              children: [
                bankIcon,
                const Gap(16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //account name
                    SizedBox(
                      child: Text(
                        bankItem.accountName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      width: screenWidth(context) / 2,
                    ),
                    const Gap(8),
                    //account number
                    SizedBox(
                      child: Text(bankItem.accountNumber,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                          overflow: TextOverflow.ellipsis),
                      width: screenWidth(context) / 2,
                    ),
                    const Gap(8),
                    //Name
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                      SizedBox(
                        child: Text(
                          bankItem.bankName,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 12),
                        ),
                        width: screenWidth(context) / 2,
                      ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          showBin
              ? GestureDetector(
                  child: binIcon,
                  onTap: deleteAccount,
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
