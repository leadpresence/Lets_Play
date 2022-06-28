import 'dart:convert';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jekawin_mobile_flutter/app/modules/wallet_home/models/fund_wallet_model.dart';
import 'package:jekawin_mobile_flutter/app/modules/fund_wallet/models/payment_processor_model.dart';

import '../../constants/app_error.dart';
import '../../constants/network_exceptions.dart';
import '../../modules/wallet_home/models/all_wallet_transactions.dart';
import '../../modules/fund_wallet/models/payment_link_response.dart';
import '../../modules/wallet_home/models/user_wallet_response.dart';
import '../../modules/wallet_home/models/withdrawalModel.dart';
import '../data/local/user_local_impl.dart';
import '../data/model/user.dart';
import 'di/di_locator.dart';
import 'http/base_urls.dart';
import 'http/http_services.dart';

abstract class UserWalletDataSource {
  Future<Either<AppError, String>> userWallet();

  Future<Either<AppError, String>> userTransactions();

  Future<Either<AppError, String>> walletTransactions(String walletId);

  Future<Either<AppError, String>> banks();
  Future<Either<AppError, String>> paymentProcessors();
  Future<Either<AppError, String>> paymentLink(String amount,String email,String processor);

  Future<Either<AppError, String>> addBank(String walletId);

  Future<Either<AppError, String>> withdrawToBank(
      WithdrawalModel withdrawalData);

  Future<Either<AppError, String>> resolveAccountNumber(
      String accountNumber, String bankCode);
}

class WalletServiceImpl extends UserWalletDataSource {
  final httpProvider = Get.find<HttpService>();
  final utilsProvider = Get.find<UtilsController>();

  final UserLocalDataSourceImpl _userLocalDataSource =
      Get.find<UserLocalDataSourceImpl>();

  User? get user => _userLocalDataSource.user;

  @override
  Future<Either<AppError, String>> addBank(String walletId) {
    // TODO: implement addBank
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, String>> banks() {
    // TODO: implement banks
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, String>> resolveAccountNumber(
      String accountNumber, String bankCode) {
    // TODO: implement resolveAccountNumber
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, String>> userTransactions() async{
    String userId = GetStorage().read('userId');

    try {
      var raw = await httpProvider
          .getHttp('${JekawinBaseUrls.wallerBaseUrl}users/$userId/transactions');
      // var walletAsMap = res.body.map((wallet) => wallet.toMap()).toList();
      // String jsonString = jsonEncode(walletAsMap);
      AllTransactionsModel res = AllTransactionsModel.fromMap(raw);
      var listOfTransactions=res.body;
      utilsProvider.transactions.value = listOfTransactions;
      if (raw['success']) {

        // return Right(jsonString);
        return Right(raw['message']);
      } else {
        return Left(
            AppError(errorType: AppErrorType.network, message: raw['message']));
      }
    } on NetworkException catch (e) {
      return Left(
          AppError(errorType: AppErrorType.network, message: e.message));
    } on SocketException catch (e) {
      return Left(
          AppError(errorType: AppErrorType.network, message: e.message));
    } on Exception {
      return const Left(
          AppError(errorType: AppErrorType.api, message: "An error occurred"));
    }
  }

  @override
  Future<Either<AppError, String>> userWallet() async {
    String userId = GetStorage().read('userId');

    try {
      var raw = await httpProvider
          .getHttp('${JekawinBaseUrls.wallerBaseUrl}wallets/$userId');
      UserWalletModel res = UserWalletModel.fromMap(raw);
      GetStorage().write('walletBalance', res.body.wallet.balance);
      GetStorage().write('wins', res.body.wins);
      GetStorage().write('rewardPoints', res.body.rewardPoints);
      if (raw['success']) {

        return Right(raw['message']);
      } else {
        return Left(
            AppError(errorType: AppErrorType.network, message: raw['message']));
      }
    } on NetworkException catch (e) {
      return Left(
          AppError(errorType: AppErrorType.network, message: e.message));
    } on SocketException catch (e) {
      return Left(
          AppError(errorType: AppErrorType.network, message: e.message));
    } on Exception {
      return const Left(
          AppError(errorType: AppErrorType.api, message: "An error occurred"));
    }
  }

  @override
  Future<Either<AppError, String>> walletTransactions(String walletId) async {
    throw UnimplementedError();

  }

  @override
  Future<Either<AppError, String>> withdrawToBank(
      WithdrawalModel withdrawalData) {
    // TODO: implement withdrawToBank
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, String>> paymentLink(String amount, email, processor) async{
    Map<String, dynamic> payload = {'amount': amount, 'email': email, 'processor':processor};

    try {
      var raw = await httpProvider.postHttp(
          '${JekawinBaseUrls.wallerBaseUrl}payment-link', payload);
      if (raw['success']) {
        PaymentLinkResponseModel res = PaymentLinkResponseModel.fromMap(raw);
        var paymentLink= res.body;
        return Right(paymentLink);
      } else {
        return Left(
            AppError(errorType: AppErrorType.network, message: raw['message']));
      }
    } on NetworkException catch (e) {
      return Left(
          AppError(errorType: AppErrorType.network, message: e.message));
    } on SocketException catch (e) {
      return Left(
          AppError(errorType: AppErrorType.network, message: e.message));
    } on Exception {
      return const Left(
          AppError(errorType: AppErrorType.api, message: "An error occurred"));
    }
  }

  @override
  Future<Either<AppError, String>> paymentProcessors() async{

    try {
      var raw = await httpProvider
          .getHttp('${JekawinBaseUrls.wallerBaseUrl}payment-processors');
      if (raw['success']) {
        PaymentProcessorModel res = PaymentProcessorModel.fromMap(raw);
         var processors = res.body;
        utilsProvider.paymentProcessors.value = processors;

        return Right(raw['message']);
      } else {
        return Left(
            AppError(errorType: AppErrorType.network, message: raw['message']));
      }
    } on NetworkException catch (e) {
      return Left(
          AppError(errorType: AppErrorType.network, message: e.message));
    } on SocketException catch (e) {
      return Left(
          AppError(errorType: AppErrorType.network, message: e.message));
    } on Exception {
      return const Left(
          AppError(errorType: AppErrorType.api, message: "An error occurred"));
    }
  }
}
