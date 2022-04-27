import 'package:get/get.dart';
import '../../guest_dashboard/views/mobile/guest_dashboard-mobile_portrait.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    Future.delayed(
      const Duration(seconds: 4),
      () => Get.off(
        () => const GuestDashboardMobilePortrait(),
        transition: Transition.cupertino,
      ),
    );
    super.onInit();
  }
}
