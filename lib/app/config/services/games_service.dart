import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import '../../services/base_service.dart';
import '../../services/local_storage.dart';
import 'di/di_locator.dart';
import 'http/base_urls.dart';

class GamesServiceImpl {
  BaseService service = BaseService();
  final utilsProvider = UtilsController();

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
    var userId = GetStorage().read('currentUserID');
    try {
      Response response =
          await service.request('users/$userId/games', method: 'Get');
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
      Response response =
          await service.request('instant-game/true-or-false/', method: 'Get');
      if (kDebugMode) {
        print(
            "This is the response status from the getTrueOrFalseGames API: \n ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> playTrueOrFalseGames({gameID, dynamic userGuess}) async {
    try {
      Response response = await service.request(
        'instant-game/true-or-false/',
        method: 'Put',
        body: {
          "userGuess": userGuess,
          "itemId": gameID,
        },
      );
      if (kDebugMode) {
        print(
            "This is the response status from the playTrueOrFalseGames API: \n ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> updateProfile(dynamic data) async {
    var currentUserID = GetStorage().read('currentUserID');
    try {
      Response response = await service.request(
        '${JekawinBaseUrls.authBaseUrl}users/$currentUserID/',
        method: 'Put',
        body: data,
      );
      if (kDebugMode) {
        print(
            "This is the response status from the playTrueOrFalseGames API: \n ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> notifications() async {
    var currentUserID = GetStorage().read('currentUserID');
    try {
      Response response = await service.request(
        '${JekawinBaseUrls.authBaseUrl}users/$currentUserID/notifications',
        method: 'Get',
      );
      if (kDebugMode) {
        print(
            "This is the response status from the notifications API: \n ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> notificationDetail(nId) async {
    var currentUserID = GetStorage().read('currentUserID');
    try {
      Response response = await service.request(
        '${JekawinBaseUrls.authBaseUrl}users/$currentUserID/notifications/$nId',
        method: 'Get',
      );
      if (kDebugMode) {
        print(
            "This is the response status from the notificationDetail API: \n ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> rewardPointsHistory() async {
    try {
      Response response = await service.request(
        '${JekawinBaseUrls.authBaseUrl}reward-points',
        method: 'Get',
      );
      if (kDebugMode) {
        print(
            "This is the response status from the rewardPointsHistory API: \n ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> shareRewardPoints(body) async {
    try {
      Response response = await service.request(
        '${JekawinBaseUrls.authBaseUrl}reward-points',
        method: 'Post',
        body: body,
      );
      if (kDebugMode) {
        print(
            "This is the response status from the shareRewardPoints API: \n ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> validateShareRewardPointsData(body) async {
    try {
      Response response = await service.request(
        '${JekawinBaseUrls.authBaseUrl}reward-points/validate-share-reward-point-data',
        method: 'Post',
        body: body,
      );
      if (kDebugMode) {
        print(
            "This is the response status from the validateShareRewardPointsData API: \n ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> verifyTransactionPin(body) async {
    var userID = GetStorage().read('currentUserID');
    try {
      Response response = await service.request(
        '${JekawinBaseUrls.authBaseUrl}users/$userID/verify-transaction-pin',
        method: 'Post',
        body: body,
      );
      if (kDebugMode) {
        print(
            "This is the response status from the verifyTransactionPin API: \n ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> unreadNotifications() async {
    var userID = GetStorage().read('currentUserID');
    try {
      Response response = await service.request(
        '${JekawinBaseUrls.authBaseUrl}users/$userID/unread-notifications',
        method: 'Get',
      );
      if (kDebugMode) {
        print(
            "This is the response status from the unreadNotifications API: \n ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }
}
