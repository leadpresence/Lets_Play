import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:jekawin_mobile_flutter/app/services/base_service.dart';

class RedeemPrizesServices {
  final BaseService baseService = BaseService();

  Future<Response> getUserGamePrizes() async {
    try {
      Response response = await baseService.request(
        'player-prizes',
        method: 'Get',
      );
      if (kDebugMode) {
        print(
            "This is the response status from the getUserGamePrizes API: \n ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> getAParticularWinningPrize({prizeId}) async {
    try {
      Response response = await baseService.request(
        'player-prizes/$prizeId',
        method: 'Get',
      );
      if (kDebugMode) {
        print(
            "This is the response status from the getAParticularWinningPrize API: \n ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> redeemPrize(
      {prizeId, required Map<String, dynamic> body}) async {
    try {
      Response response = await baseService.request(
        'player-prizes/$prizeId/redeem-prize',
        method: 'Put',
        body: body,
      );
      if (kDebugMode) {
        print(
            "This is the response status from the redeemPrize API: \n ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }
}
