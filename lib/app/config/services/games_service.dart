import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import '../../services/base_service.dart';

class GamesServiceImpl {
  BaseService service = BaseService();

  Future<Response> getAllJackpotGames() async {
    try {
      Response response = await service.request('jackpot', method: 'Get');
      if (kDebugMode) {
        print(
            "This is the response status from the getAllJackpotGames API: \n  ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> stackOnAGame({gameID, dynamic body}) async {
    try {
      Response response =
          await service.request('games/$gameID', body: body, method: 'Post');
      if (kDebugMode) {
        print(
            "This is the response status from the stackOnAGame API: \n ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> getAllPlayedGames() async {
    var userId = GetStorage().read('userId');
    try {
      Response response = await service.request('users/$userId/games', method: 'Get');
      if (kDebugMode) {
        print(
            "This is the response status from the getAllPlayedGames API: \n  ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> getTrueOrFalseGames() async {
    try {
      Response response = await service
          .request('instant-game/true-or-false/', method: 'Get');
      if (kDebugMode) {
        print(
            "This is the response status from the getTrueOrFalseGames API: \n ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }
}
