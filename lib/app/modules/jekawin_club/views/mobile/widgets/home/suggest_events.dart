import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/views/mobile/success_or_failure_mobile_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';
import 'package:jekawin_mobile_flutter/app/modules/jekawin_club/views/mobile/widgets/components/custom_text_field.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_large_button.dart';

class SuggestEvents extends StatelessWidget {
  const SuggestEvents({Key? key}) : super(key: key);

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
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            top: 12.0,
          ),
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Event Suggestion',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff414249),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  Text(
                    'EVENT NAME',
                    style: GoogleFonts.mulish(
                      color: const Color(0xff747B84),
                      letterSpacing: .4,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const NormalTextField(
                    hintText: "Enter event name",
                    textCapitalization: TextCapitalization.none,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'INCLUDE A SHORT DESCRIPTION ABOUT YOUR EVENT',
                    style: GoogleFonts.mulish(
                      color: const Color(0xff747B84),
                      letterSpacing: .4,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const NormalTextField(
                    hintText: "Enter a short description about your event",
                    textCapitalization: TextCapitalization.none,
                    keyboardType: TextInputType.text,
                    maxLines: 4,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'DATE:',
                            style: GoogleFonts.mulish(
                              color: const Color(0xff747B84),
                              letterSpacing: .4,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          NormalTextField(
                            width: Get.width * .42,
                            hintText: "Enter a date",
                            textCapitalization: TextCapitalization.none,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TIME:',
                            style: GoogleFonts.mulish(
                              color: const Color(0xff747B84),
                              letterSpacing: .4,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          NormalTextField(
                            width: Get.width * .42,
                            hintText: "Enter a time",
                            textCapitalization: TextCapitalization.none,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'LOCATION',
                    style: GoogleFonts.mulish(
                      color: const Color(0xff747B84),
                      letterSpacing: .4,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  NormalTextField(
                    hintText: "Enter a location",
                    textCapitalization: TextCapitalization.none,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        'assets/svgs/location_.svg',
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'UPLOAD A FEATURED IMAGE',
                    style: GoogleFonts.mulish(
                      color: const Color(0xff747B84),
                      letterSpacing: .4,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(vertical: 52),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xffECEEEE),
                        width: 1.4,
                      ),
                    ),
                    child: Column(
                      children: [
                        SvgPicture.asset('assets/svgs/image_.svg'),
                        const SizedBox(height: 12),
                        Text(
                          'Upload Image',
                          style: GoogleFonts.mulish(
                            color: const Color(0xff747B84),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'This event suggestion will accessed and considered or rejected by admin.',
                    style: GoogleFonts.mulish(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    height: 48,
                    child: CustomButton(
                      onPressed: () {
                        Get.to(
                          () => SuccessOrFailureMobileView(
                            msg: 'Event Suggestion Successful',
                            className: JekawinBottomTabs(
                              tabIndex: 4,
                            ),
                          ),
                          transition: Transition.cupertino,
                        );
                      },
                      buttonText: 'Submit',
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
