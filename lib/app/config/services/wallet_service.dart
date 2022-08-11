import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jekawin_mobile_flutter/app/modules/fund_wallet/models/payment_processor_model.dart';
import 'package:jekawin_mobile_flutter/app/modules/select_account/models/withdrawal_response.dart';
import 'package:jekawin_mobile_flutter/app/modules/wallet_home/models/transaction_model.dart';
import '../../constants/app_error.dart';
import '../../constants/network_exceptions.dart';
import '../../modules/add_bank_acccount/models/account_name_response.dart';
import '../../modules/add_bank_acccount/models/bank_response_model.dart';
import '../../modules/select_account/models/delete_account_response.dart';
import '../../modules/wallet_home/models/all_wallet_transactions.dart';
import '../../modules/fund_wallet/models/payment_link_response.dart';
import '../../modules/wallet_home/models/user_wallet_response.dart';
import '../../modules/wallet_home/models/withdrawalModel.dart';
import '../data/local/user_local_impl.dart';
import '../data/model/user.dart';
import 'di/di_locator.dart';
import 'http/base_urls.dart';
import 'http/http_services.dart';

abstract class WalletDataSource {
  Future<Either<AppError, String>> userWallet();

  Future<UserWalletModel> userWalletAsync();

  Future<String> userRewardPoint();

  Future<Either<AppError, String>> userTransactions();

  Future<Either<AppError, String>> walletTransactions(String walletId);

  Future<List<TransactionsModel>> allWalletTransactions();

  Future<List<BankResponse>> savedBanks();

  Future<List<Bank>> getBanks();

  Future<Either<AppError, String>> paymentProcessors();

  Future<Either<AppError, String>> paymentLink(
      String amount, String email, String processor);

  Future<Either<AppError, String>> addBank(
  String accountName,String bankName, String accountNumber, String bankCode);
Future<Either<AppError, String>> removeBank(
       String accountNumber);

  Future<Either<AppError, WithdrawalResponse>> withdrawToBank(
      WithdrawalModel withdrawalData);

  Future<Either<AppError, String>> resolveAccountNumber(
      String accountNumber, String bankCode);
}

class WalletServiceImpl extends WalletDataSource {
  final httpProvider = Get.find<HttpService>();
  final utilsProvider = Get.find<UtilsController>();

  final UserLocalDataSourceImpl _userLocalDataSource =
      Get.find<UserLocalDataSourceImpl>();

  User? get user => _userLocalDataSource.user;

  @override
  Future<Either<AppError, String>> addBank(
      String accountName,String bankName, String accountNumber, String bankCode) async {
    Map<String, dynamic> payload = {
      "accountName": accountName,
      "accountNumber": accountNumber,
      "bankName": bankName,
      "bankCode": bankCode
    };
    String walletId = GetStorage().read('walletId');
    utilsProvider.walletId.value = walletId;
    try {
      var raw = await httpProvider.postHttp(
          '${JekawinBaseUrls.walletBaseUrl}wallets/add-bank',
          payload);
      if (raw['success']) {
        return const Right("Account saved successfully");
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
  Future<UserWalletModel> userWalletAsync() async {
    String userId = GetStorage().read('currentUserID');
    var raw = await httpProvider
        .getHttp('${JekawinBaseUrls.walletBaseUrl}wallets/$userId');
    UserWalletModel res = UserWalletModel.fromMap(raw);
    return res;
  }

  @override
  Future<List<BankResponse>> savedBanks() async {
    var currentUserID = GetStorage().read('currentUserID');

    var raw = await httpProvider
        .getHttp('${JekawinBaseUrls.walletBaseUrl}wallets/$currentUserID');

    UserWalletModel res = UserWalletModel.fromMap(raw);

    return res.body.banks;
  }

  @override
  Future<Either<AppError, String>> resolveAccountNumber(
      String accountNumber, String bankCode) async {
    Map<String, String> params = {
      "accountNumber": accountNumber,
      "bankCode": bankCode
    };

    try {
      var raw = await httpProvider.getHttp(
          '${JekawinBaseUrls.walletBaseUrl}bank-account-owner?accountNumber=$accountNumber&bankCode=$bankCode');
      AccountNameResponseModel res = AccountNameResponseModel.fromMap(raw);

      if (raw['success']) {
        return Right(utilsProvider.accountName.value =
            res.accountDetails.data.data.accountName);
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
  Future<Either<AppError, String>> userTransactions() async {
    String userId = GetStorage().read('currentUserID');
    try {
      var raw = await httpProvider.getHttp(
          '${JekawinBaseUrls.walletBaseUrl}users/$userId/transactions');
      AllTransactionsModel res = AllTransactionsModel.fromMap(raw);
      var listOfTransactions = res.body;
      if (raw['success']) {
        utilsProvider.transactions.value.addAll(listOfTransactions);
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
    var currentUserID = GetStorage().read('currentUserID');
    try {
      var raw = await httpProvider
          .getHttp('${JekawinBaseUrls.walletBaseUrl}wallets/$currentUserID');
      UserWalletModel res = UserWalletModel.fromMap(raw);
      GetStorage().write('walletBalance', res.body.wallet.balance);
      GetStorage().write('walletId', res.body.id);
      GetStorage().write('rewardPoints', res.body.rewardPoint);

      if (res.body.banks.isNotEmpty) {
        utilsProvider.savedBanks.value.clear();
        utilsProvider.savedBanks.value.addAll(res.body.banks);
      }
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
  Future<Either<AppError, WithdrawalResponse>> withdrawToBank(
      WithdrawalModel withdrawalData) async {
    Map<String, dynamic> payload = {
      'amount': withdrawalData.amount,
      'email': withdrawalData.email,
      "bankCode": withdrawalData.bankCode,
      "accountNumber": withdrawalData.accountNumber
    };
    try {
      var raw = await httpProvider.postHttp(
          '${JekawinBaseUrls.walletBaseUrl}withdraw-to-bank', payload);

      WithdrawalResponse res = WithdrawalResponse.fromMap(raw);

      if (raw['success']) {
        return  Right(res);
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
  Future<Either<AppError, String>> paymentLink(
      String amount, email, processor) async {
    Map<String, dynamic> payload = {
      'amount': amount,
      'email': email,
      'processor': processor
    };

    try {
      var raw = await httpProvider.postHttp(
          '${JekawinBaseUrls.walletBaseUrl}payment-link', payload);
      if (raw['success']) {
        PaymentLinkResponseModel res = PaymentLinkResponseModel.fromMap(raw);
        var paymentLink = res.body;
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
  Future<Either<AppError, String>> paymentProcessors() async {
    try {
      var raw = await httpProvider
          .getHttp('${JekawinBaseUrls.walletBaseUrl}payment-processors');
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

  @override
  Future<List<TransactionsModel>> allWalletTransactions() async {
    String userId = GetStorage().read('currentUserID');
    var raw = await httpProvider
        .getHttp('${JekawinBaseUrls.walletBaseUrl}users/$userId/transactions');
    AllTransactionsModel res = AllTransactionsModel.fromMap(raw);
    var listOfTransactions = res.body;
    return res.body;
  }



  @override
  Future<String> userRewardPoint() async {
    String userId = GetStorage().read('currentUserID');
    var raw = await httpProvider
        .getHttp('${JekawinBaseUrls.walletBaseUrl}wallets/$userId');
    UserWalletModel res = UserWalletModel.fromMap(raw);
    return res.body.rewardPoint.toString();
  }

  @override
  Future<List<Bank>> getBanks() async {
    var raw =
        await httpProvider.getHttp('${JekawinBaseUrls.walletBaseUrl}banks');
    BanksResponseModel res = BanksResponseModel.fromMap(raw);
    utilsProvider.banks.value.addAll(res.body.data);
    return res.body.data;
  }

  @override
  Future<Either<AppError, String>> removeBank(String accountNumber) async{
    Map<String, String> payload = {"accountNumber": accountNumber};
    String walletId =      GetStorage().read('walletId');
    try {
      var raw = await httpProvider.putHttp(
          '${JekawinBaseUrls.authBaseUrl}wallets/remove-bank',
          payload);
      if (raw['success']) {
        DeleteAccountResponse res = DeleteAccountResponse.fromMap(raw);

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
