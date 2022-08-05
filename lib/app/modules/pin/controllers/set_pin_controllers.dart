import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../config/services/auth_service.dart';
import '../../e_shop/views/mobile/success_or_failure_mobile_view.dart';
import '../../user_profile/views/user_profile_view.dart';

class SetPinController extends GetxController
    with SingleGetTickerProviderMixin {
  final AuthServiceImpl authService = Get.find<AuthServiceImpl>();
  var isLoading = false.obs;

  final pinController = TextEditingController();
  final confirmPinController = TextEditingController();
  late Rx<AnimationController> animationController =
      AnimationController(vsync: this).obs;

  RxString errorPinMessage = "".obs;
  RxString errorConfirmPinMessage = "".obs;

  void clearErrorPin() => errorPinMessage.value = '';

  void clearErrorConfirmPin() => errorConfirmPinMessage.value = '';

  pinFormValidator(Key? k) {
    if ((GetUtils.isBlank(pinController.text)) == true) {
      return errorPinMessage.value = 'Pin field cannot be blank.';
    } else if (pinController.text == '1234') {
      return errorPinMessage.value = '1234 is not a secured pin';
    } else if (pinController.text.length < 4) {
      errorPinMessage.value = "      Pin must be 4 digits";
    }
  }

  confirmPinFormValidator(Key? k) {
    if (confirmPinController.text.length == 4 &&
        confirmPinController.text != pinController.text) {
      return errorConfirmPinMessage.value = 'Pin confirmation does not match';
    } else {
      setUserPin();
    }
  }

  Future<void> setUserPin() async {

    isLoading.value = true;
    String pin = pinController.text.toString();
    String confirmPin = confirmPinController.text.toString();
    var pinData = await authService.setPin(pin, confirmPin);

    pinData.fold((l) {
      isLoading.value = false;
      BotToast.showText(text: l.message);
    }, (r) {
      isLoading.value = false;

      Get.to(() => SuccessOrFailureMobileView(
            msg: "Transaction pin set successful",
            className: const UserProfileView(),
          ));
      transition:
      Transition.cupertino;
    });
  }
}
