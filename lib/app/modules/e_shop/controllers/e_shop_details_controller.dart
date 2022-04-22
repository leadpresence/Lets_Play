import 'package:get/get.dart';

class EShopDetailsController extends GetxController {
  List<String> sizes = ['XS', 'S', 'M', 'L', 'XL'];
  RxString currentSize = 'M'.obs;

  void changeSize(String size) {
    currentSize.value = size;
    update();
  }
}
