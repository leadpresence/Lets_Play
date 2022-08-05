// WithdrawalConfirmationController
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../config/services/auth_service.dart';
import '../../e_shop/views/mobile/success_or_failure_mobile_view.dart';
import '../../jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';

class WithdrawalConfirmationController extends GetxController {
  final AuthServiceImpl authService = Get.find<AuthServiceImpl>();
  var isLoading = false.obs;

  final pinController = TextEditingController();
  String userPin = GetStorage().read('pin');

  @override
  void onInit() {}

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void dispose() {}

  @override
  void onClose() {}

  Future<void> validatePin() async {
    isLoading.value=true;
    var userPin = pinController.text.toString();
    var pinValidation = await authService.verifyPin(userPin);

    pinValidation.fold((l) {
      isLoading.value=false;
      BotToast.showText(text: "Error verifying pin, try again "+ l.message);
      pinController.text="";
    }, (r) {
      isLoading.value=false;
      Get.to(
        () => SuccessOrFailureMobileView(
          msg: "Your request is being processed",
          className: JekawinBottomTabs(
            tabIndex: 2,
          ),
        ),
        transition: Transition.cupertino,
      );
      pinController.text="";
    });
  }
}
