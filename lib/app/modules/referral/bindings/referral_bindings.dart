import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/referral/controllers/referral_controller.dart';



class ReferralBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReferralController>(() => ReferralController());
  }
}
