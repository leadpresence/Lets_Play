import 'package:get/get.dart';

class SplashController extends GetxController {
  Rx<int> number = 0.obs;
  Rx<bool> isAMan = false.obs;

  void increment() {
    number.value++;
  }

  void decrement() {
    number.value--;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
