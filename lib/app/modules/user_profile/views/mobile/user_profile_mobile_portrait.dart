import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jekawin_mobile_flutter/app/modules/user_profile/controllers/user_profile_cntroller.dart';

import '../../../edit_profile/views/mobile/edit_profile_mobile_porttrait.dart';

class UserProfileMobilePortrait extends StatelessWidget {
  UserProfileMobilePortrait({Key? key}) : super(key: key);

  final UserProfileController controller = Get.put(UserProfileController());

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
              Get.back();
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
                                      imageAvatar,
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
                                      ? firstName
                                      : '$firstName $lastName',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                const Gap(8),
                                Text(
                                  phoneNumber,
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
                                  () =>EditProfileMobilePortrait(),
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
                    InkWell(
                      onTap: () {
                        controller.signout(key);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/svgs/logout_icon.svg'),
                              const Gap(16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Log out',
                                    style: GoogleFonts.dmSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                      color: const Color(0xff414249),
                                    ),
                                  ),
                                  const Gap(6),
                                  Text(
                                    'Further secure your account for safety',
                                    style: GoogleFonts.mulish(
                                      fontSize: 11,
                                      fontWeight: FontWeight.normal,
                                      color: const Color(0xff747B84),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SvgPicture.asset('assets/svgs/chevron.svg')
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
