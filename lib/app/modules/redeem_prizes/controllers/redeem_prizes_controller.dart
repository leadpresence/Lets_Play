import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/views/mobile/success_or_failure_mobile_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/redeem_prizes/models/user_game_prize_model.dart';
import 'package:jekawin_mobile_flutter/app/modules/redeem_prizes/services/redeem_prizes_service.dart';
import 'package:jekawin_mobile_flutter/app/modules/redeem_prizes/views/mobile/redeem_prizes_mobile_portrait.dart';
import '../../../utils/helpers/text_helper.dart';
import '../models/view_particular_winning_prize_item_model.dart';

class RedeemPrizesController extends GetxController {
  RedeemPrizesServices redeemPrizesServices = Get.put(RedeemPrizesServices());
  PlayerPrizesResponse? playerPrizesResponse;
  ViewWinningPrizeItemModel? viewWinningPrizeItemResponse;
  String selectedDeliveryOption = 'delivery';
  TextEditingController deliveryAddress = TextEditingController(),
      deliveryPhone = TextEditingController(),
      comment = TextEditingController();

  RxString errorDeliveryAddressMessage = ''.obs,
      errorDeliveryPhoneMessage = ''.obs,
      errorCommentMessage = ''.obs;
  Rx<bool> checkDelivery = true.obs,
      checkPickUp = false.obs,
      isLoading = false.obs;

  void clearErrorDeliveryAddress() => errorDeliveryAddressMessage.value = '';
  void clearErrorDeliveryPhone() => errorDeliveryPhoneMessage.value = '';
  void clearErrorComment() => errorCommentMessage.value = '';

  Future<PlayerPrizesResponse?> getPlayerPrizes(Key? k) async {
    try {
      final updateRes = await redeemPrizesServices.getUserGamePrizes();
      playerPrizesResponse = PlayerPrizesResponse.fromJson(updateRes.data);
      if (updateRes.statusCode == 200 || updateRes.statusCode == 201) {
      } else {
        BotToast.showSimpleNotification(
          title: PlayerPrizesResponse.fromJson(updateRes.data).toString(),
        );
      }
      return playerPrizesResponse;
    } catch (e) {
      BotToast.showText(
        text: "An error occurred. Please try again. $e",
      );
    }
    return null;
  }

  Future<ViewWinningPrizeItemModel?> getAParticularWinningPrize(Key? k,
      {prizeId}) async {
    try {
      final updateRes = await redeemPrizesServices.getAParticularWinningPrize(
        prizeId: prizeId,
      );
      viewWinningPrizeItemResponse =
          ViewWinningPrizeItemModel.fromJson(updateRes.data);
      if (updateRes.statusCode == 200 || updateRes.statusCode == 201) {
      } else {
        BotToast.showSimpleNotification(
          title: ViewWinningPrizeItemModel.fromJson(updateRes.data).toString(),
        );
      }
      return viewWinningPrizeItemResponse;
    } catch (e) {
      BotToast.showText(
        text: "An error occurred. Please try again. $e",
      );
    }
    return null;
  }

  void deliveryToggle() {
    if (checkPickUp.value == true) {
      checkDelivery.value = true;
      checkPickUp.value = false;
      selectedDeliveryOption = 'delivery';
    }
    update();
  }

  void pickUpToggle() {
    if (checkDelivery.value == true) {
      checkPickUp.value = true;
      checkDelivery.value = false;
      selectedDeliveryOption = 'pick up';
    }

    update();
  }

  deliveryDetailsValidator(Key? k, {prizeId}) {
    if ((GetUtils.isBlank(deliveryAddress.text)) == true) {
      return errorDeliveryAddressMessage.value = "Required";
    } else if ((GetUtils.isBlank(deliveryPhone.text)) == true) {
      return errorDeliveryPhoneMessage.value = "Required";
    } else if (!deliveryPhone.text.startsWith('0')) {
      errorDeliveryPhoneMessage.value = "Phone number must start with zero";
    } else if (deliveryPhone.text.length != 11) {
      errorDeliveryPhoneMessage.value = "Phone number must be 11 digits";
    } else {
      redeemPrize(k, prizeId: prizeId);
    }
  }

  void redeemPrize(Key? k, {prizeId}) async {
    isLoading.value = true;
    final body = comment.text == ''
        ? {
            "deliveryType": selectedDeliveryOption,
            "phoneNumber": TextUtils()
                .stripFirstZeroAddCountryCode(number: deliveryPhone.value.text)
                .toString(),
            "address": deliveryAddress.text,
          }
        : {
            "deliveryType": selectedDeliveryOption,
            "comment": comment.text,
            "phoneNumber": TextUtils()
                .stripFirstZeroAddCountryCode(number: deliveryPhone.value.text)
                .toString(),
            "address": deliveryAddress.text,
          };
    try {
      final updateRes =
          await redeemPrizesServices.redeemPrize(prizeId: prizeId, body: body);
      playerPrizesResponse = PlayerPrizesResponse.fromJson(updateRes.data);
      if (updateRes.statusCode == 200 || updateRes.statusCode == 201) {
        isLoading.value = false;
        Get.to(
          () => SuccessOrFailureMobileView(
            msg: 'Successful',
            success: true,
            className: RedeemPrizesMobilePortrait(),
          ),
        );
      } else {
        BotToast.showSimpleNotification(
          title: updateRes.data['message'].toString(),
        );
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
    }
    isLoading.value = false;
    return null;
  }
}
