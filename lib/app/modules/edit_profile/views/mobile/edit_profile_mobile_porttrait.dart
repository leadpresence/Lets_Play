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
import '../../../../widgets/slide_in_animation.dart';
import '../../../e_shop/views/mobile/success_or_failure_mobile_view.dart';
import '../../../jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';
import '../../controllers/edit_profile_controllers.dart';

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

    // List of items in our dropdown menu
    var genders = [
      'Female',
      'Male',
    ];
    // Initial Selected Value
    String dropdownvalue = genders[0];
    return Scaffold(
      body: SingleChildScrollView(
          child: Form(
              child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Gap(100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                ],
              ),
              const Gap(12),

              SizedBox(
                height: 24,
                width: 90 ?? Get.width * .6,
                child: Theme(
                  data: ThemeData(
                    splashColor: Colors.white,
                    highlightColor: Colors.white,
                  ),
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFFE7A01).withOpacity(.5),
                      shadowColor: Colors.transparent,
                      onPrimary: const Color(0xFFFE7A01).withOpacity(.1),
                      onSurface: Colors.white,
                      elevation: 0,
                      // splashFactory: NoSplash.splashFactory,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36),
                      ),
                    ), child:const  Text("Upload",style: TextStyle(color: Colors.white,fontSize: 14),),
                  ),
                ),
              ),
              const Gap(42),
              editFormField(hint: "what's your first name"),
              const Gap(16),
              editFormField(hint: "And your last name"),

              const Gap(16),
              editFormField(hint: "phone number"),
              const Gap(16),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField(
                        decoration:   InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFDADEE3).withOpacity(.5),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0x0ff8e8e8), width: 4)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.orange.withOpacity(.9), width: 3)),
                        ),
                        // Initial Value
                          value: dropdownvalue,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),
                          // Array list of items
                          items: genders.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            // setState((){dropdownvalue = newValue!;}) ;
                          }),
                    ),
              ),

              const Gap(16),
              editFormField(hint: "Address"),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: SlideInAnimation(
                  duration: const Duration(milliseconds: 775),
                  child: CustomButton(
                    // isLoading: controller.isLoading.value,
                    buttonText: "Update profile",
                    onPressed: () {
                      //validate form and submit
                      // controller.signUpFormValidator(key);
                      Get.to(
                            () => const SuccessOrFailureMobileView(
                          msg: 'Profile uppdate successful',
                          className: JekawinBottomTabs(
                            tabIndex: 0,
                            isGuestUser: true,
                          ),
                        ),
                        transition: Transition.cupertino,
                      );
                    },
                  ),
                ),
              ),
            ]),
      ))),
    );
  }

  Widget editFormField({dynamic controller, String? hint}) {
    return SizedBox(
        child: TextField(
      // controller:controller,
      decoration: InputDecoration(
        hintText: hint ?? "",
        filled: true,
        fillColor: Color(0xFFDADEE3).withOpacity(.5),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0x0ff8e8e8), width: 4)),
        focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: Colors.orange.withOpacity(.9), width: 3)),
      ),
    ));
  }
}
