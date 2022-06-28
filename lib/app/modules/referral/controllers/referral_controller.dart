import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jekawin_mobile_flutter/app/config/services/di/di_locator.dart';
import 'package:jekawin_mobile_flutter/app/config/services/subscriber_service.dart';

class ReferralController extends GetxController {

  final subscriberService = Get.find<SubscriberServiceImpl>();
  final referralsProvider = Get.find<UtilsController>();
  var isLoading = false.obs;
  var referralCode = "".obs;
  RxList refs = [].obs;

  @override
  void onInit() {
    referralCode.value = GetStorage().read('referralCode');
    getReferralList();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void dispose() {

  }

  @override
  void onClose() {}

  Future<void> getReferralList() async {
    isLoading.value = true;
    final referralData = await subscriberService.getReferrals();
    referralData.fold(
      (l) {
        BotToast.showText(text: l.message);
        isLoading.value = false;
      },
      (r) {
        //get all the referrals from
        refs.value = referralsProvider.guestLists;
        debugPrint("REFERRALS::"+refs .toString());
        isLoading.value = false;
      },
    );
  }
}
