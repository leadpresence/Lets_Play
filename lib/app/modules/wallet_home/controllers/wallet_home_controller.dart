import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jekawin_mobile_flutter/app/config/services/wallet_service.dart';
import 'package:jekawin_mobile_flutter/app/modules/wallet_home/models/transaction_model.dart';

import '../../../config/services/di/di_locator.dart';

class WalletHomeController extends GetxController{
  final WalletServiceImpl walletService = Get.find<WalletServiceImpl>();
  final transactionsProvider = Get.find<UtilsController>();

  var balance = 0.obs;
  var rewardPoints = 0.obs;
  var wins = 0.obs;
  RxList transactions = [].obs;

  var trnxsList = <TransactionsModel>[].obs;

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

  Future<void> getUserWallet() async {
    final wallet = await  walletService.userWallet();
    wallet.fold((l) {
      BotToast.showText(text: l.message);
    }, (r) {
    });
  }

  Future<void> getUserTransactions() async {
    final trxns = await  walletService.userTransactions();
    trxns.fold((l) {
      BotToast.showText(text: l.message);
    }, (r) {
      transactions.value = transactionsProvider.transactions;
      // dynamic jsonData = jsonDecode(r);
      // trnxsList.value = jsonData.map((transaction) =>
      //     AllTransactionsModel.fromMap(transaction)).toList().obs;
    });
  }





    @override
  void dispose() {}

  @override
  void onClose() {}
}