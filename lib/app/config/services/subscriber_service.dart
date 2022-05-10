import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/constants/app_error.dart';
import 'package:jekawin_mobile_flutter/app/modules/referral/models/ReferralResponse.dart';
import '../../constants/network_exceptions.dart';
import '../../utils/simple_log_printer.dart';
import '../data/local/user_local_impl.dart';
import '../data/model/user.dart';
import 'di/di_locator.dart';
import 'http/base_urls.dart';
import 'http/http_services.dart';

abstract class SubscriberService {
  Future<Either<AppError, String>> getReferrals();
}

class SubscriberServiceImpl extends SubscriberService {
  final httpProvider = Get.find<HttpService>();
  final utilsProvider = Get.find<UtilsController>();

  final UserLocalDataSourceImpl _userLocalDataSource =
      Get.find<UserLocalDataSourceImpl>();

  User? get user => _userLocalDataSource.user;

  @override
  Future<Either<AppError, String>> getReferrals() async {
    try {
      final raw = await httpProvider
          .getHttp('${JekawinBaseUrls.subscriberBaseUrl}referals');
      ReferralsResponseModel res =
      ReferralsResponseModel.fromMap(raw);
      var data = res.data.guestInvites;
      /// get the list of referrals from data
      /// and set it to referrals provider
      utilsProvider.guestLists.value = data;
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
}
