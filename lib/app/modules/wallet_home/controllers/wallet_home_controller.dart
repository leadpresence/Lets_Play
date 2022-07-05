import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jekawin_mobile_flutter/app/config/services/wallet_service.dart';
import 'package:jekawin_mobile_flutter/app/modules/wallet_home/models/transaction_model.dart';
import 'package:jekawin_mobile_flutter/app/modules/wallet_home/models/user_wallet_response.dart';

import '../../../config/services/di/di_locator.dart';

class WalletHomeController extends GetxController {
  final WalletServiceImpl walletService = Get.find<WalletServiceImpl>();
  final transactionsProvider = Get.find<UtilsController>();

  var balance = 0.obs;
  var rewardPoints = 0.obs;
  var wins = 0.obs;
  Rx<List<TransactionsModel>> transactions = Rx<List<TransactionsModel>>([]);

  var trnxsList = <TransactionsModel>[].obs;

  Future<void> getUserWallet() async {
    final wallet = await walletService.userWallet();
    wallet.fold((l) {
      BotToast.showText(text: l.message);
    }, (r) {});
  }

  Future<List<TransactionsModel>> getUserTransactions() async {
    List<TransactionsModel> trxns = await walletService.allWalletTransactions();
    try {
      return trxns;
    } catch (e) {
      BotToast.showText(text: "Error occured retrieving history");
    }
    return [];
  }
  Future<UserWalletModel?> getWalletAsync() async {
  UserWalletModel userWallet = await walletService.userWalletAsync();
    try {
      return userWallet ;
    } catch (e) {
      print("Error retrieving Balance");
    }
    return null;
  }

  @override
  void onInit() {
    super.onInit();
    getUserWallet();
    getUserTransactions();

    balance.value = GetStorage().read('walletBalance').toInt();
    rewardPoints.value = GetStorage().read('rewardPoints');
    wins.value = GetStorage().read('wins');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {}

  @override
  void onClose() {}
}
