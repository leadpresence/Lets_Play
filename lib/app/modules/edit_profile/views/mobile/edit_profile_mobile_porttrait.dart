import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/views/widgets/profile_image_avatar.dart';

import '../../../../config/themes/app_theme_constants.dart';
import '../../../../widgets/custom_large_button.dart';
import '../../../../widgets/fade_in_animations.dart';
import '../../../../widgets/slide_in_animation.dart';
import '../../../e_shop/views/mobile/success_or_failure_mobile_view.dart';
import '../../../jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';
import '../../controllers/edit_profile_controllers.dart';
import 'email_otp_verification.dart';

class EditProfileMobilePortrait extends GetView {
  @override
  final EditProfileController controller = Get.put(EditProfileController());

  EditProfileMobilePortrait({Key? key, this.themeData, this.customAppTheme})
      : super(key: key);
  final ThemeData? themeData;
  final CustomAppTheme? customAppTheme;

  @override
  Widget build(BuildContext context) {
    var firstName = GetStorage().read("firstName");
    var lastName = GetStorage().read("lastName");
    var phoneNumber = GetStorage().read("phoneNumber");
    var imageAvatar = GetStorage().read("profileImage");

    var genders = [
      'Female',
      'Male',
    ];
    String dropDownValue = genders[0];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            splashRadius: 24,
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
      body: SingleChildScrollView(
        child: Obx(
          () => Form(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 48,
                    child: Container(
                      // width: Get.width,
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
                  SizedBox(
                    height: 30,
                    child: Theme(
                      data: ThemeData(
                        splashColor: Colors.white,
                        highlightColor: Colors.white,
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFFE7A01).withOpacity(.05),
                          shadowColor: Colors.transparent,
                          onPrimary: const Color(0xFFFE7A01).withOpacity(.01),
                          onSurface: Colors.white,
                          elevation: 0,
                          // splashFactory: NoSplash.splashFactory,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(36),
                          ),
                        ),
                        child: const Text(
                          "Upload Image",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFFE7A01),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(42),
                  editFormField(
                    controller: TextEditingController(text: firstName),
                    readOnly: true,
                  ),
                  const Gap(16),
                  editFormField(
                    controller: TextEditingController(text: lastName),
                    readOnly: true,
                  ),
                  const Gap(16),
                  editFormField(
                    controller: TextEditingController(text: phoneNumber),
                    readOnly: true,
                  ),
                  const Gap(16),
                  editFormField(
                    controller: controller.emailTextController,
                    hint: "Email Address",
                    onChanged: (value) {
                      controller.clearErrorEmail();
                    },
                    errorText: controller.emailErrorMessage.value,
                  ),
                  const Gap(16),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField(
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFDADEE3).withOpacity(.3),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black45,
                              width: .5,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange.withOpacity(.9),
                              width: 2,
                            ),
                          ),
                        ),
                        // Initial Value
                        value: dropDownValue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: genders.map(
                          (String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          },
                        ).toList(),
                        onChanged: (String? newValue) {},
                      ),
                    ),
                  ),
                  const Gap(16),
                  editFormField(hint: "Address"),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: CustomButton(
                      // isLoading: controller.isLoading.value,
                      buttonText: "Update profile",
                      onPressed: () {
                        controller.editProfileFormValidator();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget editFormField({
    dynamic controller,
    String? hint,
    String? errorText,
    bool readOnly = false,
    onChanged,
  }) {
    return SizedBox(
      child: TextField(
        readOnly: readOnly,
        controller: controller,
        onChanged: onChanged,
        style: TextStyle(
          color: Colors.grey.shade900,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          errorText: errorText,
          errorStyle: TextStyle(
            color: Colors.red.shade600,
            fontSize: 12,
          ),
          hintText: hint ?? "",
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 14,
          ),
          filled: true,
          fillColor: const Color(0xFFDADEE3).withOpacity(.3),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black45,
              width: .5,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange.withOpacity(.9),
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
