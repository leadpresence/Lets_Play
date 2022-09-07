import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

import '../../../config/services/games_service.dart';
import '../models/game_history_model.dart';

class MyGamesController extends GetxController {
  final GamesServiceImpl gamesService = Get.put(GamesServiceImpl());
  final searchController = TextEditingController();
  var searchedGamesData = [];
  var body;

  final f = DateFormat('dd/MM/yy');

  getAllPlayedGamesFunc() async {
    try {
      var response = await gamesService.getAllPlayedGames();
      if (response.statusCode == 200 || response.statusCode == 201) {
        body = GameHistory.fromJson(response.data);
        if (kDebugMode) {
          print("This are the values : ${body.body.games}");
        }
        return body;
      } else {
        if (kDebugMode) {
          print(
              'Response.statusCode != 200: \n${GameHistory.fromJson(response.data)}');
          BotToast.showSimpleNotification(
            title: GameHistory.fromJson(response.data).toString().trim(),
          );
        }
        return body;
      }
    } catch (e) {
      if (kDebugMode) {
     
      }
    }
    return body;
  }

  void filterSearchResults(String query) {
    List<String> searchData = [];
    searchData.addAll(body.body.games);
    if (query.isNotEmpty) {
      List<String> dummyListData = [];
      for (var item in searchData) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      }
      searchedGamesData.clear();
      searchedGamesData.addAll(dummyListData);
      return;
    } else {
      searchedGamesData.clear();
      searchedGamesData.addAll(body.body.games);
    }
  }
}
