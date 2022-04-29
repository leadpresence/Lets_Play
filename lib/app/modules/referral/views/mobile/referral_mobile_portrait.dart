import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/referral/controllers/referral_controller.dart';

import '../../../../config/themes/app_theme_constants.dart';
import '../../../../widgets/custom_medium_button.dart';

class ReferralMobilePortrait extends GetView<ReferralController> {
  @override
  ReferralMobilePortrait({Key? key, this.themeData, this.customAppTheme})
      : super(key: key);
  final ThemeData? themeData;
  final CustomAppTheme? customAppTheme;
  @override
  final ReferralController controller = Get.put(ReferralController());

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
        body: SingleChildScrollView(child: Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            top: 12.0,
          ),
          child: Column(
              children: [
                const Text(
                  'Referral',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff414249),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.only(
                    top: 18,
                    bottom: 12,
                    left: 16,
                    right: 16,
                  ),
                  width: Get.width,
                  height: Get.height * .19,
                  decoration: BoxDecoration(
                    color: const Color(0XFF543884),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Invite a friend ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ]

                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: const [
                          Text(
                            'Give a friend or family a promo code to get 2%  \ndiscount on any purchase',
                           overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomMediumButton(
                            onPressed: () {

                            },
                            width: Get.width * .36,
                            fontSize: 10.0,

                            hasIcon:true,
                            buttonText: 'Referral code',
                             buttonTextColor: const Color(0xff543884),
                            buttonColor: Colors.white,

                          ),
                          CustomMediumButton(
                            hasBorder: true,
                            borderColor: Colors.white,
                            onPressed: () {

                            },
                            width: Get.width * .36,
                            fontSize: 12.0,
                            buttonText: 'Invite Friends',
                            buttonColor: const Color(0xff543884),
                            buttonTextColor: Colors.white,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Gap(20),

                // Expanded(
                //   child:
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 13,
                    itemBuilder: (BuildContext context, int position) {
                      return referralItem();
                    },
                  ),
                // ),
          ]),
        )));
  }

  Widget referralItem(){
    return   Container(
        padding: const EdgeInsets.all(12),
    // height: screenHeight(context) / 9,
    margin: const EdgeInsets.fromLTRB(8, 9, 8, 8),
    decoration: BoxDecoration(
    color: const Color(0xFFFE7A01).withOpacity(.1),
    borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Text(
            'Ola Chinedu ',
            style: TextStyle(
              fontSize: 13,
              color: const Color(0xFFFE7A01).withOpacity(.6),
              fontWeight: FontWeight.w600,
            ),
          ),

        ]),
        const Gap(10),
        Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Invitation sent ", style: TextStyle(
            fontSize: 13,
            color: const Color(0xFFFE7A01).withOpacity(.6),
            fontWeight: FontWeight.w200,
          ),),
          Text("12-12-22 ",style: TextStyle(
            fontSize: 13,
            color: const Color(0xFFFE7A01).withOpacity(.6),
            fontWeight: FontWeight.w200,),

          )]),
      ],
    ));
  }
}
