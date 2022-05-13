import 'package:bot_toast/bot_toast.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jekawin_mobile_flutter/app/modules/notification/controllers/notification_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/referral/models/ReferralResponse.dart';
import '../../../../config/themes/app_theme_constants.dart';

class NotificationMobilePortrait extends GetView<NotificationController> {
  @override
  NotificationMobilePortrait({Key? key, this.themeData, this.customAppTheme})
      : super(key: key);
  final ThemeData? themeData;
  final CustomAppTheme? customAppTheme;
  @override
  final NotificationController controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    var firstName = GetStorage().read('firstName');
    return
      // Obx(() =>
      Scaffold(
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
              top: 2.0,
            ),
            child: Column(
                children: [
                  const Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff414249),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 13,
                    itemBuilder: (BuildContext context, int position) {
                      return notificationItem();
                    },
                  ),
                  // ),
                ]),
          ))
        // ),
      );
  }

  Widget notificationItem() {
    return Container(
        padding: const EdgeInsets.fromLTRB(0, 9, 8, 8),
        margin: const EdgeInsets.fromLTRB(0, 9, 8, 8),
        decoration: BoxDecoration(
          color: const Color(0xFFFE7A01).withOpacity(.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12,0,8,0),
              child:  SizedBox(
                height: 44,
                width: 44,
                child: SvgPicture.asset(
                  'assets/svgs/Notification.svg',
                  color:  Colors.transparent,

                ),
              ),

            )],),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Text(
                        "Deposit of ₦15,000 was successful. ",
                        style: TextStyle(
                          fontSize: 13,
                          color:   Colors.black,
                          fontWeight: FontWeight.w200,
                        ),
                      ),

                    ]),

                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Text(
                        "1 hour ago ",
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                        ),
                      ),

                    ]),
              ],
            ),
          ],
        ));
  }
}
