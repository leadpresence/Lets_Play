import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jekawin_mobile_flutter/app/modules/fund_wallet/models/payment_processor_model.dart';

import '../../../config/services/di/di_locator.dart';
import '../../../config/services/wallet_service.dart';
import '../views/mobile/complete_funding_webview.dart';

class FundWalletController extends GetxController {
  final WalletServiceImpl walletService = Get.find<WalletServiceImpl>();
  final processorsProvider = Get.find<UtilsController>();

  final amountController = TextEditingController();
  final emailController = TextEditingController();
  final fundWalletFormKey = GlobalKey<FormState>();

  RxBool paystackSelected = true.obs;
  RxBool flutterWaveSelected = false.obs;
  RxBool submitButtonEnabled = false.obs;
  RxBool paymentLinkIsSet = false.obs;
  var paymentProcessors = <ProcessorModel>[].obs;
  RxString errAmountMessage = "".obs;
  RxString errEmailMessage = "".obs;

  var amount = "".obs;
  var paymentLink = "".obs;
  var processorId = "".obs;
  var buttonText = "Submit".obs;

  void clearErrorAmount() => errAmountMessage.value = '';
  void clearErrorEmail() => errEmailMessage.value = '';

  void toggle() {
    paystackSelected.value = !paystackSelected.value;
    if (paystackSelected.value) {
      flutterWaveSelected.value = !paystackSelected.value;
      try {
        ProcessorModel paystack = paymentProcessors
            .firstWhere((processor) => processor.name == "Paystack");
        processorId.value = paystack.id;
      } catch (e) {
        debugPrint.printError(info: "Error selecting Paystack as processor:: $e");
      }
    }
  }

  void toggleF() {
    flutterWaveSelected.value = !flutterWaveSelected.value;
    if (flutterWaveSelected.value) {
      paystackSelected.value = !flutterWaveSelected.value;

      try {
        ProcessorModel flutterwave = paymentProcessors
            .firstWhere((processor) => processor.name == "Flutterwave");
        processorId.value = flutterwave.id;
      } catch (e) {
        debugPrint.printError(info: "Error selecting flutterwave as processor:: $e");
      }
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() {
    getPaymentProcessors();
  }

  fundFormValidator() {
    if ((GetUtils.isBlank(amountController.text)) == true) {
      return errAmountMessage.value = 'Amount field cannot be blank.';
    } else if (int.parse(amountController.text.toString()) < 200) {
      errAmountMessage.value = "amount can only b form 200 and above";
    }else if ((GetUtils.isBlank(emailController.text)) == true) {
      return errAmountMessage.value = 'Email is required';
    }
    else {
      clearErrorAmount();
      clearErrorEmail();
      getPaymentLink();
    }
  }

  Future<void> getPaymentProcessors() async {
    final wallet = await walletService.paymentProcessors();
    wallet.fold((l) {
      BotToast.showText(text: l.message);
    }, (r) {
      paymentProcessors.value = processorsProvider.paymentProcessors.cast();
      //set processor id to be paystack by default
      try {
        ProcessorModel paystack = paymentProcessors
            .firstWhere((processor) => processor.name == "Paystack");
        processorId.value = paystack.id;
      } catch (e) {
        debugPrint.printError(
            info: "Error setting  Paystack as default processor: $e");
      }
    });
  }

  Future<void> getPaymentLink() async {
    var amount = amountController.text.toString();
    var email =amountController.text.toString(); //GetStorage().read('email').toString();
    var selectedProcessor = processorId.value.toString();
    final link =
        await walletService.paymentLink(amount, email, selectedProcessor);
    link.fold((l) {
      BotToast.showText(text: l.message);
    }, (r) {
      paymentLink.value = r;
      paymentLinkIsSet.value = true;
      buttonText.value = "Continue";
    });
  }

  void navigateTWebView() {
    if (paymentLinkIsSet.value) {
      var webUrl = paymentLink.value.toString();
      Get.to(
        () => CompleteFundingWebView(url: webUrl),
        transition: Transition.cupertino,
      );
    }
  }

  @override
  void dispose() {}

  @override
  void onClose() {}
}
