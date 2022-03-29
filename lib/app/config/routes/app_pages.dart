import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/auth/views/auth_home.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/bindings/e_shop_binding.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/views/e_shop_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/signup/bindings/sign_up_bindings.dart';
import 'package:jekawin_mobile_flutter/app/modules/splash/views/splash_view.dart';

import '../../modules/auth/bindings/auth_binding.dart';
import '../../modules/signup/views/sign_up.dart';
import '../../modules/splash/bindings/splash_bindings.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  
  static final routes = [
     GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.eShop,
      page: () => const EShopView(),
      binding: EShopBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.auth,
      page: () => const AuthHomeView(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.signup,
      page: () => const SignUpView(),
      binding: SignUpBindings(),
      transition: Transition.fadeIn,
    ),
  ];
}
