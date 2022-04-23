import 'package:get/get.dart';

class EShopMakePaymentController extends GetxController {
  Rx<bool> checkDelivery = true.obs,
      checkPickUp = false.obs,
      checkRewardPoints = true.obs,
      checkDebitCard = false.obs;

  void deliveryToggle() {
    checkDelivery.value = !checkDelivery.value;
    update();
  }

  void pickUpToggle() {
    checkDelivery.value = !checkDelivery.value;
    update();
  }

  void rewardPointsToggle() {
    checkDelivery.value = !checkDelivery.value;
    update();
  }

  void debitCardToggle() {
    checkDelivery.value = !checkDelivery.value;
    update();
  }
}
