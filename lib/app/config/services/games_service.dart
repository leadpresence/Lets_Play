import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/dashboard/models/jackpot_game_model.dart';
import '../../constants/app_error.dart';
import '../../constants/network_exceptions.dart';
import 'di/di_locator.dart';
import 'http/base_urls.dart';
import 'http/http_services.dart';

abstract class GamesServiceDataSource {
  Future<Either<AppError, String>> getJackPotGame();
}

class GamesServiceImpl extends GamesServiceDataSource {
  final httpProvider = Get.find<HttpService>();
  final prospectIsProvider = Get.find<UtilsController>();
  late JackpotGameModel jackpotGameRetrievedRes;

  @override
  Future<Either<AppError, String>> getJackPotGame() async {
    try {
      var raw = await httpProvider.getHttp(
        '${JekawinBaseUrls.gamesBaseUrl}jackpot',
      );
      if (raw['success']) {
        jackpotGameRetrievedRes = JackpotGameModel.fromJson(raw);
        return const Right("Success");
      } else {
        return Left(
          AppError(
            errorType: AppErrorType.network,
            message: raw['message'],
          ),
        );
      }
    } on NetworkException catch (e) {
      return Left(
        AppError(errorType: AppErrorType.network, message: e.message),
      );
    } on SocketException catch (e) {
      return Left(
        AppError(errorType: AppErrorType.network, message: e.message),
      );
    } on Exception {
      return const Left(
        AppError(errorType: AppErrorType.api, message: "An error occurred"),
      );
    }
  }
}
