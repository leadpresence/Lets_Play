import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import '../../../config/services/games_service.dart';
import '../../e_shop/views/mobile/success_or_failure_mobile_view.dart';
import '../../jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';
import '../../login/views/login.dart';
import '../models/reward_points_response_model.dart';
import '../views/mobile/input_transaction_pin_mobile_portrait.dart';

class RewardPointsController extends GetxController {
  final GamesServiceImpl gamesServiceImpl = Get.put(GamesServiceImpl());

  final TextEditingController receiverPhoneTextController =
          TextEditingController(),
      amountOfPointsTextController = TextEditingController(),
      transactionPinController = TextEditingController();

  final transactionPinFocusNode = FocusNode();

  final Color focusedBorderColor = const Color(0xff414249),
      fillColor = Colors.grey.shade200,
      borderColor = Colors.grey.withOpacity(.5);

  final PinTheme defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: GoogleFonts.poppins(
      fontSize: 22,
      color: Colors.purple.shade900,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      border: Border.all(
        color: Colors.grey.withOpacity(.5),
      ),
    ),
  );

  Rx<bool> isLoading = false.obs;
  RewardPointsResponseModel? data;

  @override
  void dispose() {
    transactionPinController.dispose();
    transactionPinFocusNode.dispose();
    super.dispose();
  }

  RxString receiverPhoneFieldError = "".obs;
  RxString amountOfPointsFieldError = "".obs;
  RxString pinError = "".obs;

  void clearReceiverPhoneFieldError() => receiverPhoneFieldError.value = "";
  void clearAmountOfPointsFieldError() => amountOfPointsFieldError.value = "";
  void clearPinError() => pinError.value = "";

  shareRewardPointsValidation(Key? k) {
    if ((GetUtils.isBlank(amountOfPointsTextController.text)) == true) {
      return amountOfPointsFieldError.value =
          'Amount of points field cannot be blank';
    } else if (int.parse(amountOfPointsTextController.text) >
        data!.data!.total!) {
      return amountOfPointsFieldError.value =
          'You have insufficient reward point to share';
    } else if ((GetUtils.isBlank(receiverPhoneTextController.text)) == true) {
      return receiverPhoneFieldError.value =
          'Recipient phone number field cannot be blank.';
    } else if (!receiverPhoneTextController.text.startsWith('0')) {
      receiverPhoneFieldError.value =
          "Recipient phone number must start with zero";
    } else if (receiverPhoneTextController.text.length != 11) {
      receiverPhoneFieldError.value =
          "Recipient phone number must be 11 digits";
    } else {
      validateShareRewardPointsData(k);
    }
  }

  pinValidation(Key? k) {
    if ((GetUtils.isBlank(transactionPinController.text)) == true) {
      return pinError.value = 'Pin is required';
    } else if (transactionPinController.text.length != 4) {
      pinError.value = "Pin must be 4 digits";
    } else {
      verifyTransactionPin(k);
    }
  }

  Future<RewardPointsResponseModel?> rewardPointsHistory(Key? k) async {
    try {
      final res = await gamesServiceImpl.rewardPointsHistory();
      if (res.statusCode == 200 || res.statusCode == 201) {
        data = RewardPointsResponseModel.fromJson(res.data);
        return data;
      }
    } catch (e) {
      BotToast.showText(
        text: "An error occurred. Please try again. $e",
      );
    }
    return null;
  }

  Future<void> shareRewardPoints(Key? k) async {
    isLoading.value = true;
    Map<String, dynamic> body = {
      "recipient": "+234${receiverPhoneTextController.text.substring(1)}",
      "amount": int.parse(amountOfPointsTextController.text),
    };
    try {
      final res = await gamesServiceImpl.shareRewardPoints(body);
      if (res.statusCode == 200 || res.statusCode == 201) {
        Get.to(
          () => SuccessOrFailureMobileView(
            msg: res.data['message'],
            className: JekawinBottomTabs(
              tabIndex: 4,
            ),
          ),
        );
        isLoading.value = false;
      } else {
        receiverPhoneFieldError.value = res.data["message"];
        if (res.data["message"]['name'] == 'TokenExpiredError') {
          Get.offAll(() => const LoginView());
        }
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
    }
  }

  Future<void> validateShareRewardPointsData(Key? k) async {
    isLoading.value = true;
    Map<String, dynamic> body = {
      "recipient": "+234${receiverPhoneTextController.text.substring(1)}",
      "amount": int.parse(amountOfPointsTextController.text),
    };
    try {
      final res = await gamesServiceImpl.validateShareRewardPointsData(body);
      if (res.statusCode == 200 || res.statusCode == 201) {
        Get.to(
          () => InputTransactionPinMobilePortrait(),
          transition: Transition.cupertino,
        );
        isLoading.value = false;
      } else {
        receiverPhoneFieldError.value = res.data["message"];
        if (res.data["message"]['name'] == 'TokenExpiredError') {
          Get.offAll(() => const LoginView());
        }
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
    }
  }

  Future<void> verifyTransactionPin(Key? k) async {
    isLoading.value = true;
    Map<String, dynamic> body = {
      "pin": transactionPinController.text,
    };
    try {
      final res = await gamesServiceImpl.verifyTransactionPin(body);
      if (res.statusCode == 200 || res.statusCode == 201) {
        shareRewardPoints(k);
      } else {
        pinError.value = res.data["message"];
        if (res.data["message"]['name'] == 'TokenExpiredError') {
          Get.offAll(() => const LoginView());
        }
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
    }
  }
}
