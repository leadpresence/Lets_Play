import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/views/mobile/e_shop_make_payment.dart';
import '../../../../config/themes/app_theme_constants.dart';
import '../../../../widgets/fade_in_animations.dart';
import '../../controllers/e_shop_controller.dart';

class EditDeliveryInformationMobilePortrait extends GetView {
  @override
  final EShopController controller = Get.put(EShopController());
  EditDeliveryInformationMobilePortrait(
      {Key? key, this.themeData, this.customAppTheme})
      : super(key: key);
  final ThemeData? themeData;
  final CustomAppTheme? customAppTheme;

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
            splashRadius: 24,
            icon: SvgPicture.asset(
              'assets/svgs/chevronLeft.svg',
              color: const Color(0xff12121D),
            ),
            onPressed: () {
              Get.back();
              Get.back();
              Get.to(() => EShopMakePaymentMobileView(),
                  transition: Transition.leftToRight);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.only(
                bottom: 12,
              ),
              child: Text(
                "Edit Delivery Details",
                style: GoogleFonts.mulish(
                  fontWeight: FontWeight.w600, // light
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                  fontSize: 20, // italic
                ),
              ),
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Gap(16),
                    editFormField(
                      hint: "Phone",
                      textController: controller.phoneText,
                    ),
                    const Gap(16),
                    editFormField(
                      hint: "Address",
                      textController: controller.homeAddressText,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
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
            // fontSize: controller.emailErrorMessage.value == '' ? 0 : 10,
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

  Future<dynamic> showImageBigCard() {
    return showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return FadeIn(
          duration: const Duration(milliseconds: 200),
          delay: const Duration(milliseconds: 100),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: Get.width),
              child: Container(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 24.0,
                      offset: Offset(0.0, 10.0),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // To make the card compact
                  children: [
                    const SizedBox(height: 4.0),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                        top: 16.0,
                        bottom: 16.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Profile Picture',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFFFE7A01),
                            ),
                          ),
                          InkWell(
                            onTap: () => Get.back(),
                            child: SvgPicture.asset(
                              'assets/svgs/cancel.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
