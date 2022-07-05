import 'dart:html';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jekawin_mobile_flutter/app/modules/select_account/models/bank_model.dart';
import 'package:jekawin_mobile_flutter/app/modules/select_account/views/mobile/withdrawal_amount_screen.dart';
import 'package:jekawin_mobile_flutter/app/modules/wallet_home/models/withdrawalModel.dart';

import '../../../config/services/di/di_locator.dart';
import '../../../config/services/wallet_service.dart';
import '../../e_shop/views/mobile/success_or_failure_mobile_view.dart';
import '../../jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';
import '../views/mobile/withdrawal_confirmation_screen.dart';

class SelectBankController extends GetxController {
  final WalletServiceImpl walletService = Get.find<WalletServiceImpl>();
  final utilsProvider = Get.find<UtilsController>();
  TextEditingController amountController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  var isLoading = false.obs;


  Rx<List<BankModel>> savedBanksList = Rx<List<BankModel>>([]);
  RxString errAmountMessage = "".obs;
  RxInt balance = 0.obs;

  void clearErrorAmount() => errAmountMessage.value = '';

  fundFormValidator() {
    if ((GetUtils.isBlank(amountController.text)) == true) {
      return errAmountMessage.value = 'Amount field cannot be blank.';
    } else if (GetUtils.isNumericOnly(amountController.text) == false) {
      return errAmountMessage.value = 'Amount can only be numbers.';
    } else {
      Get.to(() => WithdrawalConfirmation());
    }
  }

  withdrawalFormValidator() {
    if (GetUtils.isBlank(pinController.text) == true) {
      BotToast.showText(text: "Pin can not be blank");
    }
    else {
      BankModel withdrawalAccount = utilsProvider.withdrawalAccount.value[0];
      var email = GetStorage().read('email');

      WithdrawalModel data = WithdrawalModel(
          email: email,
          accountNumber: withdrawalAccount.accountNumber,
          bankCode: withdrawalAccount.bankCode,
          amount: int.parse(amountController.text.toString())
      );
      performWithdrawal(data);
    }
  }

  Future<void> getUserWallet() async {
    final wallet = await walletService.userWallet();
    wallet.fold((l) {
      BotToast.showText(text: "An error occurred,please try again.");
    }, (r) {
      savedBanksList.value = [];
      savedBanksList.value.addAll(utilsProvider.savedBanks.value);
    });
  }

  Future<void> performWithdrawal(WithdrawalModel data) async {
    isLoading.value = true;

    final wallet = await walletService.withdrawToBank(data);
    wallet.fold((l) {
      BotToast.showText(text: l.message);
      isLoading.value = false;
    }, (r) {
      isLoading.value = false;
      navigateToSignUpSuccessful();
    });
  }

  void navigateToSignUpSuccessful() {
    Get.to(
          () => const SuccessOrFailureMobileView(
        msg: 'Withdrawal successful',
        className: JekawinBottomTabs(
          tabIndex: 0,
          isGuestUser: true,
        ),
      ),
      transition: Transition.cupertino,
    );
  }

  setWithdrawalAccount(BankModel account) {
    utilsProvider.withdrawalAccount.value.clear();
    utilsProvider.withdrawalAccount.value.add(account);
    Get.to(()=>WithdrawalAmountScreen());
  }

  @override
  void onInit() {
    super.onInit();
    getUserWallet();
    balance.value = GetStorage().read('walletBalance');
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void dispose() {}

  @override
  void onClose() {}
}
