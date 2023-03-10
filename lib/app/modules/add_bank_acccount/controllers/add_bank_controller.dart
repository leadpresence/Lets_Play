import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/add_bank_acccount/models/bank_response_model.dart';
import 'package:jekawin_mobile_flutter/app/modules/add_bank_acccount/views/add_bank_view.dart';

import '../../../config/services/di/di_locator.dart';
import '../../../config/services/wallet_service.dart';
import '../../e_shop/views/mobile/success_or_failure_mobile_view.dart';
import '../../select_account/views/select_bank_view.dart';
import '../../withdrawal_amount/views/withdrawal_amount_view.dart';

class AddBankController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getBanks();
  }

  final WalletServiceImpl walletService = Get.find<WalletServiceImpl>();
  final utilsProvider = Get.find<UtilsController>();

  final addBankFormKey = GlobalKey<FormState>();
  final cardHolderNameController = TextEditingController();
  final bankNameController = TextEditingController();
  final accountNumberController = TextEditingController();

  var isLoading = false.obs;
  RxString errorCardHolderNameMessage = "".obs;
  RxString errorBankNameMessage = "".obs;
  RxString errorAccountNumberMessage = "".obs;
  var selectedBankName = "Select Bank".obs;
  RxString selectedBankCode = "".obs;

  var banksList = [""].obs;
  Rx<List<Bank>> bList = Rx<List<Bank>>([]);
  Rx<List<DropdownMenuItem<String>>> bDropDownItemsList =
      Rx<List<DropdownMenuItem<String>>>(
    [
      const DropdownMenuItem(
        child: Text("Select Bank"),
        value: "Select Bank",
      ),
    ],
  );

  void clearErrorCardHolderName() => errorCardHolderNameMessage.value = '';

  void clearErrorBankName() => errorBankNameMessage.value = '';

  void clearErrorAccountNumber() => errorAccountNumberMessage.value = '';

  addBankFormValidator(Key? key) {
    if ((GetUtils.isBlank(bankNameController.text)) == true) {
      return errorBankNameMessage.value = 'Add full name ';
    } else if ((GetUtils.isBlank(accountNumberController.text)) == true) {
      return errorAccountNumberMessage.value = 'Add account number ';
    } else {
      addBankDetails(key);
    }
  }

  String? validateBank(String value) {
    if (value == "Select Bank") {
      return "Select Bank";
    }
    return null;
  }

  Future<List<Bank>> getBanks() async {
    List<Bank> banks = await walletService.getBanks();
    try {
      bList.value.addAll(banks);
      return banks;
    } catch (e) {
      BotToast.showText(text: "Error occurred retrieving all banks");
    }

    return [];
  }

  Future<void> getAccountName(String accountNumber, String bankCode) async {
    final bank =
        await walletService.resolveAccountNumber(accountNumber, bankCode);
    bank.fold((l) {
      BotToast.showText(
          text: "Error occurred fetching Account name,please try again");
    }, (r) {
      // BotToast.showText(text: r.toString());
      bankNameController.text = r.toString();
    });
  }

  Future<void> addBankDetails(Key? key) async {
    isLoading.value = true;
    var accountNumber = accountNumberController.text.toString();
    var bankCode = selectedBankCode.value.toString();
    var bankName = selectedBankName.value.toString();
    var accountName = bankNameController.value.text;
    final response = await walletService.addBank(
        accountName, bankName, accountNumber, bankCode);
    response.fold((l) {
      isLoading.value = false;
      Get.to(() => SuccessOrFailureMobileView(
            msg: l.message,
            success: false,
            className: const SelectBankView(),
          ));
    }, (r) {
      isLoading.value = false;
      Get.to(() => const SelectBankView());
    });
  }
}
