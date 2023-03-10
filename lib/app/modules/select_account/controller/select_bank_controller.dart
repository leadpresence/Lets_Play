import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jekawin_mobile_flutter/app/modules/select_account/models/bank_model.dart';
import 'package:jekawin_mobile_flutter/app/modules/select_account/views/mobile/select_bank_mobile_portrait.dart';
import 'package:jekawin_mobile_flutter/app/modules/select_account/views/mobile/withdrawal_amount_screen.dart';
import 'package:jekawin_mobile_flutter/app/modules/wallet_home/models/user_wallet_response.dart';
import 'package:jekawin_mobile_flutter/app/modules/wallet_home/models/withdrawalModel.dart';
import '../../../config/services/auth_service.dart';
import '../../../config/services/di/di_locator.dart';
import '../../../config/services/wallet_service.dart';
import '../../e_shop/views/mobile/success_or_failure_mobile_view.dart';
import '../../jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';
import '../views/mobile/withdrawal_confirmation_screen.dart';

class SelectBankController extends GetxController {
  final WalletServiceImpl walletService = Get.find<WalletServiceImpl>();
  final AuthServiceImpl authService = Get.find<AuthServiceImpl>();

  final utilsProvider = Get.find<UtilsController>();
  TextEditingController amountController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  var isLoading = false.obs;

  final signUpOtpController = TextEditingController();

  // Rx<List<dynamic>> savedBanksList = Rx<List<dynamic>>([]);
  Rx<List<BankResponse>> savedBanksList = Rx<List<BankResponse>>([]);
  Rx<List<BankResponse>> deleteBanksList = Rx<List<BankResponse>>([]);
  RxString errAmountMessage = "".obs;
  RxString errorPinMessage = "".obs;

  RxInt balance = 0.obs;

  void clearErrorAmount() => errAmountMessage.value = '';
  void clearErrorPin() => errorPinMessage.value = '';

  fundFormValidator() {
    if ((GetUtils.isBlank(amountController.text)) == true) {
      return errAmountMessage.value = 'Amount field cannot be blank.';
    } else if (GetUtils.isNumericOnly(amountController.text) == false) {
      return errAmountMessage.value = 'Amount can only be numbers.';
    } else {
      Get.to(() => WithdrawalConfirmation());
    }
  }

  pinFormValidator() {
    if ((GetUtils.isBlank(pinController.text)) == true) {
      return errorPinMessage.value = 'Pin field cannot be blank.';
    } else if (pinController.text.length < 4) {
      errorPinMessage.value = "      Pin must be 4 digits";
    } else {
      validatePin();
    }
  }

  setDeletableAccount(BankResponse bank, context) {
    deleteBanksList.value.clear();
    deleteBanksList.value.add(bank);
  }

  Future<void> getUserWallet() async {
    final wallet = await walletService.userWallet();
    wallet.fold((l) {
      BotToast.showText(text: "An error occurred acquiring saved accounts.");
    }, (r) {
      savedBanksList.value = [];
      savedBanksList.value.addAll(utilsProvider.savedBanks.value);
    });
  }

  Future<List<BankResponse>?> getUserSavedAccount() async {
    List<BankResponse> userSavedAccounts = await walletService.savedBanks();
    try {
      return userSavedAccounts;
    } catch (e) {
      print("Error retrieving saved banks");
    }
    return [];
  }

  Future<void> performWithdrawal(WithdrawalModel data) async {
    isLoading.value = true;

    final wallet = await walletService.withdrawToBank(data);
    wallet.fold((l) {
      BotToast.showText(text: l.message);
      isLoading.value = false;
    }, (r) {
      isLoading.value = false;
      navigateToWithdrawalSuccessful();
    });
  }

  Future<void> deleteSavedAccount(dynamic context) async {
    isLoading.value = true;
    var bank = deleteBanksList.value.first;
    debugPrint("bank-value::${bank.bankName}");
    final result = await walletService.removeBank(bank.accountNumber);
    result.fold((l) {
      BotToast.showText(text: l.message);
      isLoading.value = false;
    }, (r) {
      isLoading.value = false;
      Navigator.of(context).pop();
      navigateToDeleteSuccessful();
    });

  }

  void navigateToDeleteSuccessful() {
    Get.to(
      () => SuccessOrFailureMobileView(
        msg: 'Account deleted successfully.',
        className: JekawinBottomTabs(
          tabIndex: 2,
          isGuestUser: true,
        ),
      ),
      transition: Transition.cupertino,
    );
  }

  void navigateToWithdrawalSuccessful() {
    Get.to(
      () => SuccessOrFailureMobileView(
        msg: 'Withdrawal is being processed.',
        className: JekawinBottomTabs(
          tabIndex: 2,
          isGuestUser: false,
        ),
      ),
      transition: Transition.cupertino,
    );
  }

  setWithdrawalAccount(BankResponse account) {
    utilsProvider.withdrawalAccount.value.clear();
    utilsProvider.withdrawalAccount.value.add(account);
    Get.to(() => WithdrawalAmountScreen());
  }

  Future<void> validatePin() async {
    isLoading.value =true;
    var userPin = pinController.text.toString();
    var pinValidation = await authService.verifyPin(userPin);
    pinValidation.fold((l) {
      BotToast.showText(text: "Error verifying pin, try again " + l.message);
    }, (r) {
      isLoading.value = false;
      BankResponse withdrawalAccount = utilsProvider.withdrawalAccount.value[0];
      var email = GetStorage().read('email');

      WithdrawalModel data = WithdrawalModel(
          email: email,
          accountNumber: withdrawalAccount.accountNumber,
          bankCode: withdrawalAccount.bankCode,
          amount: int.parse(amountController.text.toString()));
      performWithdrawal(data);
    });
  }

  @override
  void onInit() {
    super.onInit();
    savedBanksList.value.clear();
    getUserSavedAccount();
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
