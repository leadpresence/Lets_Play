import 'package:get/get.dart';

class FundWalletController extends GetxController {

  RxBool   paystackSelected = true.obs;
  RxBool flutterWaveSelected = false.obs;

  void toggle() {
    paystackSelected.value = !paystackSelected.value;
    if(paystackSelected.value){
      flutterWaveSelected.value = !paystackSelected.value;
    }
  }
  void toggleF() {
    flutterWaveSelected.value = !flutterWaveSelected.value;
    if(flutterWaveSelected.value){
      paystackSelected.value = !flutterWaveSelected.value;
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void dispose() {}

  @override
  void onClose() {}
}
