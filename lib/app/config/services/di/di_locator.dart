import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../../init_db.dart';
import '../../data/local/user_local_impl.dart';
import '../../data/local/user_local_interface.dart';
import '../auth_service.dart';
import '../http/http_service_impl.dart';
import '../http/http_services.dart';

class ProspectIdController extends GetxController {
  ProspectIdController();
  RxString prospectId = "".obs;
  RxString phoneNumber = "".obs;

  getProspectId() => prospectId.value;

  getPhoneNumber() => phoneNumber.value;

  setProspectId(String prosId) {
    prospectId .value= prosId;
  }

  setPhoneNumber(String mobile) {
    phoneNumber.value = mobile;
  }
}
//order matters here
Future<void>  setDi()async {
  Get.lazyPut<HiveInterface>(()=>Hive);
  initHiveDb();
  Get.put(UserLocalDataSourceImpl());
  Get.lazyPut<HttpService>(()=>HttpServiceImpl());
  Get.lazyPut<ProspectIdController> (()=>ProspectIdController());
  // Get.lazyPut<AuthServiceDataSource>(()=>AuthServiceImpl());
  Get.put (AuthServiceImpl());
}