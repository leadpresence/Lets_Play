import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../guest_dashboard/views/mobile/guest_dashboard-mobile_portrait.dart';

class SplashController extends GetxController {
  // var token = GetStorage().read('token');

  @override
  void onInit() {
    // TODO: implement onInit
    Future.delayed(
      const Duration(seconds: 4),
      () => Get.off(() =>
              // token == null
              //     ?
              GuestDashboardMobilePortrait()
          // :
          // JekawinBottomTabs(
          //         tabIndex: 0,
          //       ),
          // transition: Transition.cupertino,
          ),
    );
    super.onInit();
  }
}
