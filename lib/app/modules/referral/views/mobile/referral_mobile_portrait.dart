import 'package:bot_toast/bot_toast.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jekawin_mobile_flutter/app/modules/referral/controllers/referral_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/referral/models/ReferralResponse.dart';
import 'package:jekawin_mobile_flutter/app/utils/helpers/text_helper.dart';
import 'package:share_plus/share_plus.dart';
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
    var firstName = GetStorage().read('firstName');
    return Obx(
      () => Scaffold(
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
          child: Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: 12.0,
            ),
            child: Column(children: [
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
                  bottom: 16,
                  left: 16,
                  right: 16,
                ),
                width: Get.width,
                height: Get.height * .23,
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
                        ]),
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
                        DottedBorder(
                          radius: const Radius.circular(50),
                          strokeWidth: 1,
                          dashPattern: const [4, 3],
                          color: Colors.white,
                          borderType: BorderType.RRect,
                          child: CustomMediumButton(
                            onPressed: () {
                              BotToast.showText(
                                  text: "${controller.referralCode} copied");
                            },
                            icon: 'assets/svgs/copy.svg',
                            width: Get.width * .36,
                            fontSize: 12.0,
                            hasIcon: true,
                            buttonText: controller.referralCode.value,
                            buttonTextColor: const Color(0xff543884),
                            buttonColor: Colors.white,
                          ),
                        ),
                        CustomMediumButton(
                          hasBorder: true,
                          borderColor: Colors.white,
                          onPressed: () {
                            Share.share(
                                'Hi i\'m $firstName join me on Jekawin !Let\'s Shop, Play & Win, register with my invite code ${controller.referralCode}  ',
                                subject: 'Jekwawin Invite');
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
              //
                controller.refs.isNotEmpty?
              ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: controller.refs.length,
                itemBuilder: (BuildContext context, int position) {
                  return referralItem(controller.refs[position]);
                },
              ):
              SizedBox(
              height: Get.height * .35,
                child: const Center(
                  child: Text(
                    'No Referrals yet,\n invite friends to acquire points',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff414249),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )

              // ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget referralItem(GuestInvite invite) {
    return Container(
        padding: const EdgeInsets.all(12),
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
                    invite.firstName + "- " + "@" + invite.autoUsername,
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
                  Text(
                    "Invitation sent ",
                    style: TextStyle(
                      fontSize: 13,
                      color: const Color(0xFFFE7A01).withOpacity(.6),
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  Text(
                    TextUtils().shortDate(invite.createdAt),
                    style: TextStyle(
                      fontSize: 13,
                      color: const Color(0xFFFE7A01).withOpacity(.6),
                      fontWeight: FontWeight.w200,
                    ),
                  )
                ]),
          ],
        ));
  }
}
