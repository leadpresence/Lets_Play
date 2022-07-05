import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../services/base_service.dart';

class GamesServiceImpl {
  BaseService service = BaseService();

  Future<Response> getAllJackpotGames() async {
    try {
      Response response = await service.request('jackpot', method: 'Get');
      if (kDebugMode) {
        print(
            "This is the response status from the getAllJackpotGames API: \n ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> stackOnAGame({gameID, dynamic body}) async {
    try {
      Response response =
          await service.request('games/$gameID', body: body, method: 'Get');
      if (kDebugMode) {
        print(
            "This is the response status from the stackOnAGame API: \n ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }
}
