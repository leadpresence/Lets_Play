import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/views/widgets/profile_image_avatar.dart';
import 'package:jekawin_mobile_flutter/app/modules/user_profile/views/user_profile_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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

    double screenHeight([double percent = 1]) =>
        MediaQuery.of(Get.context!).size.height * percent;

    var genders = [
      'Female',
      'Male',
    ];
    String dropDownValue = genders[0];
    var email = GetStorage().read('email');
    var isEmailVerified = GetStorage().read('isEmailVerified');
    controller.emailTextController.text =
        email ?? controller.emailTextController.text;
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
              Get.off(() => UserProfileView(),
                  transition: Transition.leftToRight);
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
                    textController: TextEditingController(text: firstName),
                    readOnly: true,
                  ),
                  const Gap(16),
                  editFormField(
                    textController: TextEditingController(text: lastName),
                    readOnly: true,
                  ),
                  const Gap(16),
                  editFormField(
                    textController: TextEditingController(text: phoneNumber),
                    readOnly: true,
                  ),
                  const Gap(16),
                  editFormField(
                    textController: controller.emailTextController,
                    hint: "Email Address",
                    onChanged: (value) {
                      controller.clearErrorEmail();
                    },
                    onTap: () {
                      if (isEmailVerified != true) {
                        showCupertinoModalBottomSheet<void>(
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          isDismissible: true,
                          enableDrag: true,
                          context: context,
                          builder: (context) => ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: SizedBox(
                              // height: MediaQuery.of(context).size.height,
                              child: Scaffold(
                                body: Container(
                                  height: screenHeight(.9),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 32),
                                      SizedBox(
                                        width: Get.width,
                                        child: const Center(
                                          child: Text(
                                            'Add Email',
                                            style: TextStyle(
                                              fontSize: 24,
                                              color: Color(0xff414249),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 24),
                                      Center(
                                        child: SizedBox(
                                          child: editFormField(
                                            focusNode:
                                                controller.searchTextField,
                                            textController:
                                                controller.emailTextController,
                                            hint: "Email Address",
                                            onChanged: (value) {
                                              controller.clearErrorEmail();
                                            },
                                            errorText: controller
                                                .emailErrorMessage.value,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 24),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 16, 0, 0),
                                        child: CustomButton(
                                          isLoading: controller.isLoading.value,
                                          buttonText: "Continue",
                                          onPressed: () {
                                            controller
                                                .editProfileFormValidator(key);
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
                    },
                    errorText: controller.emailErrorMessage.value,
                  ),
                  const Gap(8),
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
                        controller.editProfileFormValidator(key);
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
    dynamic textController,
    String? hint,
    String? errorText,
    bool readOnly = false,
    onChanged,
    onTap,
    focusNode,
  }) {
    return SizedBox(
      child: TextField(
        onTap: onTap,
        focusNode: focusNode,
        readOnly: readOnly,
        controller: textController,
        onChanged: onChanged,
        style: TextStyle(
          color: Colors.grey.shade900,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          errorText: errorText,
          errorStyle: TextStyle(
            fontSize: controller.emailErrorMessage.value == '' ? 0 : 10,
            color: Colors.deepOrange,
            // height: 1.8,
            letterSpacing: .2,
            fontWeight: FontWeight.bold,
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
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black45,
              width: .5,
            ),
          ),
          focusedErrorBorder: UnderlineInputBorder(
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
