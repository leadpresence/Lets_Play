import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jekawin_mobile_flutter/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/my_games/views/mobile/my_games_mobile_portrait.dart';
import 'package:jekawin_mobile_flutter/app/modules/pin/views/set_pin_mobile_portrait.dart';
import 'package:jekawin_mobile_flutter/app/modules/resetpassword/views/mobile/reset_password_mobile_potrait.dart';
import 'package:jekawin_mobile_flutter/app/modules/security_question/views/mobile/question_mobile_portrait.dart';
import 'package:jekawin_mobile_flutter/app/modules/user_profile/controllers/user_profile_cntroller.dart';
import 'package:jekawin_mobile_flutter/app/services/local_storage.dart';
import '../../../edit_profile/views/mobile/edit_profile_mobile_porttrait.dart';
import '../../../jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';
import '../../../select_account/views/select_bank_view.dart';
import '../../../wallet_home/controllers/wallet_home_controller.dart';

class UserProfileMobilePortrait extends StatelessWidget {
  UserProfileMobilePortrait({Key? key}) : super(key: key);

  final UserProfileController controller = Get.put(UserProfileController());
  final WalletHomeController walletController = Get.put(WalletHomeController());
  final DashboardController dashboardController =
      Get.put(DashboardController());

  var firstName = GetStorage().read("firstName");
  var lastName = GetStorage().read("lastName");
  var phoneNumber = GetStorage().read("phoneNumber");
  var imageAvatar = GetStorage().read("profileImage").split("?")[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            splashRadius: 25,
            icon: SvgPicture.asset(
              'assets/svgs/chevronLeft.svg',
              color: const Color(0xff12121D),
            ),
            onPressed: () {
              Get.off(
                () => JekawinBottomTabs(
                  tabIndex: 0,
                ),
                transition: Transition.fadeIn,
              );
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 12.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  width: Get.width,
                  height: Get.height * .17,
                  decoration: BoxDecoration(
                    color: const Color(0XFF543884),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 36,
                                backgroundColor: Colors.white10,
                                child: imageAvatar == ''
                                    ? Stack(
                                        children: [
                                          Container(
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                colorFilter:
                                                    const ColorFilter.mode(
                                                  Colors.black45,
                                                  BlendMode.dstIn,
                                                ),
                                                onError: (__, ___) {
                                                  const NetworkImage(
                                                    'data:image/png;base64,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',
                                                  );
                                                },
                                                image: NetworkImage(
                                                  imageAvatar,
                                                ),
                                                // fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          const Center(
                                            child: CupertinoActivityIndicator(
                                              // strokeWidth: 1,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: SizedBox(
                                          width: Get.width,
                                          child: Image.network(
                                            imageAvatar,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                              ),
                              const Gap(12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    lastName == ''
                                        ? firstName ?? ''
                                        : '$firstName $lastName',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  const Gap(8),
                                  Text(
                                    phoneNumber ?? "",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                () => EditProfileMobilePortrait(),
                                transition: Transition.cupertino,
                              );
                            },
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/svgs/ic_outline-mode-edit-outline.svg',
                                ),
                                const Gap(12),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 24.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.04),
                        blurRadius: 12,
                        spreadRadius: 8,
                      )
                    ],
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      userProfileCardItem(
                          onTap: () {
                            Get.to(
                              () => ResetPasswordMobilePortrait(),
                              transition: Transition.cupertino,
                            );
                          },
                          text: "required",
                          description: "Make changes to your account",
                          icon: 'assets/svgs/change_password.svg'),
                      userProfileCardItem(
                          onToggle: (value) {},
                          onTap: () {},
                          text: "Touch ID",
                          description: "Manage your device security",
                          icon: 'assets/svgs/change_password.svg',
                          isFingerPrint: true),
                      userProfileCardItem(
                          onTap: () {
                            Get.to(
                              () => const SelectBankView(),
                              transition: Transition.cupertino,
                            );
                          },
                          text: "Bank Details",
                          description:
                              "Link your bank details for payment and \nwithdrawals",
                          icon: 'assets/svgs/bank_details.svg'),
                      userProfileCardItem(
                          onTap: () {
                            Get.to(
                              () => SetPinMobilePortrait(),
                              transition: Transition.cupertino,
                            );
                          },
                          text: "Set Transaction Pin",
                          description: "Set a pin for secured transactions",
                          icon: 'assets/svgs/secure_.svg'),
                      userProfileCardItem(
                          onTap: () {
                            Get.to(
                              () => QuestionsMobilePortrait(),
                              transition: Transition.cupertino,
                            );
                          },
                          text: "2FA Security Questions",
                          description:
                              "Set Security Question to secure and restore your account",
                          icon: 'assets/svgs/two_fa.svg'),
                      userProfileCardItem(
                          onTap: () {
                            Get.to(
                              () => MyGamesMobilePortrait(),
                              transition: Transition.cupertino,
                            );
                          },
                          text: "My Games",
                          description: "View game History",
                          icon: 'assets/svgs/my_games.svg'),
                      userProfileCardItem(
                          onTap: () {
                            LocalStorage.deleteToken();
                            GetStorage().write('email', "");
                            GetStorage().write('isEmailVerified', false);
                            walletController.balance.value = 0;
                            controller.signout(key);
                          },
                          text: "Log out",
                          description: 'Further secure your account for safety',
                          icon: 'assets/svgs/logout_icon.svg'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget userProfileCardItem({
    void Function(bool value)? onToggle,
    required void Function() onTap,
    required String text,
    required String description,
    required String icon,
    bool isFingerPrint = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  icon,
                  color: const Color(0XFFFE7A01),
                ),
                const Gap(16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: GoogleFonts.dmSans(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xff414249),
                      ),
                    ),
                    const Gap(6),
                    SizedBox(
                      width: isFingerPrint == true
                          ? Get.width * .4
                          : Get.width * .6,
                      child: Wrap(
                        children: [
                          Text(
                            description,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.mulish(
                              fontSize: 11,
                              fontWeight: FontWeight.normal,
                              color: const Color(0xff747B84),
                            ),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            isFingerPrint
                ? FlutterSwitch(
                    activeColor: Colors.grey.shade100,
                    activeToggleColor: Colors.green.shade300,
                    width: 40.0,
                    height: 22.0,
                    valueFontSize: 25.0,
                    toggleSize: 15.0,
                    value: true,
                    borderRadius: 30.0,
                    padding: 4.0,
                    showOnOff: false,
                    onToggle: onToggle!,
                  )
                : SvgPicture.asset('assets/svgs/chevron.svg')
          ],
        ),
      ),
    );
  }
}
