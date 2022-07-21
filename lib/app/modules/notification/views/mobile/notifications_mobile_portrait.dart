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
import 'package:jekawin_mobile_flutter/app/modules/notification/models/notification_model.dart';
import 'package:jekawin_mobile_flutter/app/modules/referral/models/ReferralResponse.dart';
import '../../../../config/themes/app_theme_constants.dart';
import '../../../../widgets/fade_in_animations.dart';
import '../../../../widgets/time_ago.dart';

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
        child: Padding(
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
              FutureBuilder<NotificationsModel?>(
                future: controller.getNotifications(key),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(
                        "Snapshot has error: ${snapshot.hasError.toString()}");
                  } else if (snapshot.hasData) {
                    var body = snapshot.data!;
                    return body.body.notifications.isEmpty
                        ? const Text(
                            "No Notifications History",
                          )
                        : ListView.builder(
                            reverse: false,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: body.body.notifications.length,
                            itemBuilder: (BuildContext context, int position) {
                              return notificationItem(
                                message:
                                    body.body.notifications[position].content,
                                timeAgo: TimeAgo.timeAgoSinceDate(body
                                    .body.notifications[position].createdAt
                                    .toString()),
                                image: body.body.notifications[position].event
                                            .title ==
                                        "reward point"
                                    ? 'assets/svgs/no_ou.png'
                                    : 'assets/svgs/no_in.png',
                              );
                            },
                          );
                  }
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 24.0),
                      child: CircularProgressIndicator(
                        color: Color(0xffFE7A01),
                        strokeWidth: 3,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget notificationItem({
    message,
    timeAgo,
    image,
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 8, 0),
                child: SizedBox(
                  height: 44,
                  width: 44,
                  child: Image.asset(
                    'assets/svgs/no_in.png',
                  ),
                ),
              )
            ],
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width * .65,
                    child: Text(
                      message ?? "Message",
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w200,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    timeAgo ?? "Time Ago",
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.black54,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
