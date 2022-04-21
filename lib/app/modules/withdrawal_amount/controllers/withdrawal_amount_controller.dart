import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:jekawin_mobile_flutter/app/modules/withdrawal_confirmation/views/withrawal_confirmation_view.dart';

class WithdrawalAmountController extends GetxController {
  final addAmountFormKey = GlobalKey<FormState>();
  final accountNumberController = TextEditingController();

  var isLoading = false.obs;
  RxString errorAccountNumberMessage = "".obs;

  void clearErrorAccountNumber() => errorAccountNumberMessage.value = '';

  addAmountFormValidator(Key? key) {
    if ((GetUtils.isBlank(accountNumberController.text)) == true) {
      return errorAccountNumberMessage.value = 'Add valid account number ';
    } else if ((GetUtils.isBlank(accountNumberController.text.length != 10)) ==
        true) {
      return errorAccountNumberMessage.value =
          'Account number should be 10 digits';
    } else {
      continueToNext();
    }
  }

  continueToNext() {
    Get.to(()=>const WithdrawalConfirmationView());
  }
}
