import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/add_bank_acccount/bindings/add_bank_binding.dart';
import 'package:jekawin_mobile_flutter/app/modules/auth/views/auth_home.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/bindings/e_shop_binding.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/views/e_shop_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/edit_profile/views/edit_profile_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/fund_wallet/bindings/fund_wallet_bindings.dart';
import 'package:jekawin_mobile_flutter/app/modules/fund_wallet/views/fund_wallet_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/leaderboard/biindings/leaderboard_bindings.dart';
import 'package:jekawin_mobile_flutter/app/modules/leaderboard/views/leaderboard_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/login/bindings/login_bindings.dart';
import 'package:jekawin_mobile_flutter/app/modules/login/views/login.dart';
import 'package:jekawin_mobile_flutter/app/modules/my_games/bindings/my_games_bindings.dart';
import 'package:jekawin_mobile_flutter/app/modules/my_games/views/my_games_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/new_password/views/new_password.dart';
import 'package:jekawin_mobile_flutter/app/modules/notification/views/notification_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/referral/bindings/referral_bindings.dart';
import 'package:jekawin_mobile_flutter/app/modules/referral/views/referral_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/resetpassword/views/reset_password.dart';
import 'package:jekawin_mobile_flutter/app/modules/select_account/views/select_bank_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/signup/bindings/sign_up_bindings.dart';
import 'package:jekawin_mobile_flutter/app/modules/splash/views/splash_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/wallet_home/bindings/wallet_home_bindings.dart';
import 'package:jekawin_mobile_flutter/app/modules/wallet_home/views/wallet_home_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/withdrawal_amount/bindings/withdrawal_amount_bindings.dart';
import 'package:jekawin_mobile_flutter/app/modules/withdrawal_amount/views/withdrawal_amount_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/withdrawal_confirmation/bindings/withrawal_confirmation_bindings.dart';

import '../../modules/add_bank_acccount/views/add_bank_view.dart';
import '../../modules/auth/bindings/auth_binding.dart';
import '../../modules/messages/bindings/messages_bindings.dart';
import '../../modules/messages/views/response_message.dart';
import '../../modules/resetpassword/bindings/reset_password_bindings.dart';
import '../../modules/select_account/bindings/select_bank_binding.dart';
import '../../modules/signup/views/sign_up.dart';
import '../../modules/signup_verification/bindings/singup_verification_bindings.dart';
import '../../modules/signup_verification/views/otp_signup_verification.dart';
import '../../modules/splash/bindings/splash_bindings.dart';
import '../../modules/withdrawal_confirmation/views/withrawal_confirmation_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.myGames;

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
    GetPage(
      name: _Paths.signupVerification,
      page: () => const OtpSignUpVerificationView(),
      binding: SignupVerificationBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
      binding: LoginBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.resetPassword,
      page: () => const ResetPasswordPhoneView(),
      binding: ResetPasswordBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.response,
      page: () => ResponseMessageView(status: true),
      binding: MessagesBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.updatePassword,
      page: () => const UpdatePasswordView(),
      binding: ResetPasswordBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.walletHome,
      page: () => const WalletHomeView(),
      binding: WalletHomeBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.fundWallet,
      page: () => const FundWalletView(),
      binding: FundWalletBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.selectBank,
      page: () => const SelectBankView(),
      binding: SelectBankBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.addBank,
      page: () => const AddBankView(),
      binding: AddBankBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.withdrawalAmount,
      page: () => const WithdrawalAmountView(),
      binding: WithdrawalAmountBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.withdrawalConfirmation,
      page: () => const WithdrawalConfirmationView(),
      binding: WithdrawalConfirmationBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.referral,
      page: () => const ReferralView(),
      binding: ReferralBindings(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: _Paths.editProfile,
      page: () => const EditProfileView(),
      binding: ReferralBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.notification,
      page: () => const NotificationView(),
      binding: ReferralBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.leaderBoard,
      page: () => const LeaderBoardView(),
      binding: LeaderBoarBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.myGames,
      page: () => const MyGamesView(),
      binding: MyGamesBindings(),
      transition: Transition.fadeIn,
    ),
  ];
}
