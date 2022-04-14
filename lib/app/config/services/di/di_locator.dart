import 'package:get/get.dart';

class ProspectIdController extends GetxController {
  RxString prospectId = "".obs;

  getProspectId() => prospectId.value;

  setProspectId(String prosId) {
    prospectId = prosId as RxString;
  }
}
