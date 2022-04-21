import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddBankController extends GetxController{

  final addBankFormKey = GlobalKey<FormState>();
  final cardHolderNameController = TextEditingController();
  final bankNameController = TextEditingController();
  final accountNumberController = TextEditingController();


  var isLoading = false.obs;
  RxString errorCardHolderNameMessage = "".obs;
  RxString errorBankNameMessage = "".obs;
  RxString errorAccountNumberMessage = "".obs;

  void clearErrorCardHolderName() => errorCardHolderNameMessage.value = '';
  void clearErrorBankName() => errorBankNameMessage.value = '';
  void clearErrorAccountNumber() => errorAccountNumberMessage.value = '';

  addBankFormValidator(Key? key){
    if((GetUtils.isBlank(cardHolderNameController.text))==true){
      return errorCardHolderNameMessage.value = 'Add full name ';

    }else if((GetUtils.isBlank(accountNumberController.text))==true){
      return errorAccountNumberMessage.value = 'Add account number ';

    }
    else{
      addBankDetails(key);
    }

  }

  Future<void> addBankDetails(Key? key)async {

  }

  @override
  void onInit() {}

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