import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jekawin_mobile_flutter/app/modules/my_games/views/mobile/my_games_mobile_portrait.dart';
import 'package:jekawin_mobile_flutter/app/modules/pin/views/set_pin_mobile_portrait.dart';
import 'package:jekawin_mobile_flutter/app/modules/resetpassword/views/mobile/reset_password_mobile_potrait.dart';
import 'package:jekawin_mobile_flutter/app/modules/user_profile/controllers/user_profile_cntroller.dart';

import '../../../edit_profile/views/mobile/edit_profile_mobile_porttrait.dart';
import '../../../jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';
import '../../../wallet_home/controllers/wallet_home_controller.dart';

class UserProfileMobilePortrait extends StatelessWidget {
  UserProfileMobilePortrait({Key? key}) : super(key: key);

  final UserProfileController controller = Get.put(UserProfileController());
  final WalletHomeController walletController = Get.put(WalletHomeController());

  @override
  Widget build(BuildContext context) {
    var firstName = GetStorage().read("firstName");
    var lastName = GetStorage().read("lastName");
    var phoneNumber = GetStorage().read("phoneNumber");
    var imageAvatar = GetStorage().read("profileImage");
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
              Get.to(
                () => JekawinBottomTabs(
                  tabIndex: 0,
                ),
                transition: Transition.cupertino,
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
                              child: Container(
                                height: Get.height / 5,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    colorFilter: const ColorFilter.mode(
                                      Colors.black45,
                                      BlendMode.dstIn,
                                    ),
                                    onError: (__, ___) {},
                                    image: NetworkImage(
                                      imageAvatar ??
                                          'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAALoAAAC6CAMAAAAu0KfDAAAAOVBMVEX///8AAADs7Oxra2uXl5f8/Pw1NTXU1NTw8PBnZ2fExMQgICBNTU3c3Nx1dXUxMTFBQUGxsbFhYWHBLujbAAAA6UlEQVR4nO3cbY7CIBiFUS32Qx2Kdv+LnQ1UIEbnbTLnLODm+UsgnE4AAAAAAAAAsNw6LNGVu+bHvekxR1fumqdz0yT9w6RHkB5BegTpEaRHkB5BegTpEaRHkB5BeoS5tNPLMdPz9tO05ejKXWPuMEZXAgBA1Vj3RxPvGNYyvVbWjvv/pTExfCs9VQ9v1570a3UiSZcuXbp06dKlS5cuXbp06dKlS2+np570xkRQ+paHprwdMr2ktSnVn0BEpX+AdOnSpUuXLl26dOnSpUuXLl26dOlR6cvz8mXPY37aAwAAAAAAAADw3/wCNHspK9U90TMAAAAASUVORK5CYII=',
                                    ),
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
                                      ? firstName ?? 'First name'
                                      : '$firstName $lastName',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                const Gap(8),
                                Text(
                                  phoneNumber ?? "09060785373",
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
                  children: [
                    userProfileCardItem(
                        onTap: () {
                          Get.to(
                            () => ResetPasswordMobilePortrait(),
                            transition: Transition.cupertino,
                          );
                        },
                        text: "Change Password",
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
                        onTap: () {},
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
                    Wrap(
                      children: [
                        Text(
                          description,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.mulish(
                            fontSize: 11,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xff747B84),
                          ),
                        ),
                      ],
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
