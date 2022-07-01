import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:jekawin_mobile_flutter/app/modules/select_account/models/bank_model.dart';

import '../../../config/services/di/di_locator.dart';
import '../../../config/services/wallet_service.dart';

class SelectBankController extends GetxController {

  final WalletServiceImpl walletService = Get.find<WalletServiceImpl>();
  final utilsProvider = Get.find<UtilsController>();

  Rx<List<BankModel>> savedBanksList =  Rx<List<BankModel>>([]);


  Future<void> getUserWallet() async {
    final wallet = await  walletService.userWallet();
    wallet.fold((l) {
      BotToast.showText(text: l.message);
    }, (r) {
      savedBanksList.value=[];
      savedBanksList.value.addAll(utilsProvider.savedBanks.value);
    });
  }
  @override
  void onInit() {
    super.onInit();
    getUserWallet();
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