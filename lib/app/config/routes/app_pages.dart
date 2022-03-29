import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/bindings/e_shop_binding.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/views/e_shop_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';

import '../../modules/auth/bindings/auth_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.jekawinBottomTabs;

  static final routes = [
    GetPage(
      name: _Paths.bottomTabs,
      page: () => const JekawinBottomTabs(),
      binding: EShopBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.auth,
      page: () => const EShopView(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
