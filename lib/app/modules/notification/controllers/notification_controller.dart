import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/services/games_service.dart';
import '../models/notification_detail_model.dart';
import '../models/notification_model.dart';

class NotificationController extends GetxController {
  final GamesServiceImpl service = Get.put(GamesServiceImpl());
  Rx<bool> isLoading = false.obs;
  NotificationsModel? responseData;
  NotificationDetailModel? detailResponseData;

  Future<NotificationsModel?> getNotifications(Key? k) async {
    isLoading.value = true;
    try {
      final updateRes = await service.notifications();
      responseData = NotificationsModel.fromJson(updateRes.data);
      if (updateRes.statusCode == 200 || updateRes.statusCode == 201) {
        isLoading.value = false;
      } else {
        print(
            'Response.statusCode != 200: \n${NotificationsModel.fromJson(updateRes.data).message}');
        BotToast.showSimpleNotification(
          title: NotificationsModel.fromJson(updateRes.data).toString(),
        );
        isLoading.value = false;
      }
      return responseData;
    } catch (e) {
      print(e.toString());
      BotToast.showText(
        text: "An error occurred. Please try again. $e",
      );
      isLoading.value = false;
    }
    return responseData;
    // return body;
  }

  Future<NotificationDetailModel?> getNotificationDetail(Key? k, nId) async {
    isLoading.value = true;
    try {
      final updateRes = await service.notificationDetail(nId);
      detailResponseData = NotificationDetailModel.fromJson(updateRes.data);
      if (updateRes.statusCode == 200 || updateRes.statusCode == 201) {
        isLoading.value = false;
      } else {
        print(
            'Response.statusCode != 200: \n${NotificationDetailModel.fromJson(updateRes.data).message}');
        BotToast.showSimpleNotification(
          title: NotificationDetailModel.fromJson(updateRes.data).toString(),
        );
        isLoading.value = false;
      }
      return detailResponseData;
    } catch (e) {
      isLoading.value = false;
    }
    return detailResponseData;
    // return body;
  }
}
