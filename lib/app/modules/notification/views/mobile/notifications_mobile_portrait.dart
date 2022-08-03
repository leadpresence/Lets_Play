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
import 'package:google_fonts/google_fonts.dart';
import 'package:jekawin_mobile_flutter/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';
import 'package:jekawin_mobile_flutter/app/modules/notification/controllers/notification_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/notification/models/notification_model.dart';
import 'package:jekawin_mobile_flutter/app/modules/referral/models/ReferralResponse.dart';
import '../../../../config/themes/app_theme_constants.dart';
import '../../../../widgets/fade_in_animations.dart';
import '../../../../widgets/time_ago.dart';
import 'notification_detail_mobile_portrait.dart';

class NotificationMobilePortrait extends GetView<NotificationController> {
  @override
  NotificationMobilePortrait({Key? key, this.themeData, this.customAppTheme})
      : super(key: key);
  final ThemeData? themeData;
  final CustomAppTheme? customAppTheme;
  @override
  final NotificationController controller = Get.put(NotificationController());
  final DashboardController dashboardController =
      Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation: .4,
            backgroundColor: Colors.white,
            expandedHeight: 104.0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: IconButton(
                splashRadius: 24,
                icon: SvgPicture.asset(
                  'assets/svgs/chevronLeft.svg',
                  color: const Color(0xff12121D),
                ),
                onPressed: () {
                  Get.to(
                    () => JekawinBottomTabs(
                      tabIndex: 0,
                    ),
                    transition: Transition.leftToRight,
                  );
                },
              ),
            ),
            stretch: true,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: const EdgeInsets.all(0),
              collapseMode: CollapseMode.pin,
              expandedTitleScale: 1,
              title: Container(
                padding: const EdgeInsets.only(
                  bottom: 12,
                ),
                child: Text(
                  "Notifications",
                  style: GoogleFonts.mulish(
                    fontWeight: FontWeight.normal, // light
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                    fontSize: 24, // italic
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      top: 12,
                      bottom: 12,
                    ),
                    child: Column(
                      children: [
                        FutureBuilder<NotificationsModel?>(
                          future: controller.getNotifications(key),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 104.0),
                                  child: Text(
                                      "Snapshot has error: ${snapshot.hasError.toString()}"),
                                ),
                              );
                            } else if (snapshot.hasData) {
                              var body = snapshot.data!;
                              return body.body.notifications.isEmpty
                                  ? const Text(
                                      "No Notifications History",
                                    )
                                  : ListView.builder(
                                      reverse: false,
                                      shrinkWrap: true,
                                      padding: EdgeInsets.zero,
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: body.body.notifications.length,
                                      itemBuilder:
                                          (BuildContext context, int position) {
                                        if (body.body.notifications[position]
                                                .seen ==
                                            false) {
                                          dashboardController
                                              .unSeenNotification.value = true;
                                        }
                                        return FadeIn(
                                          duration:
                                              const Duration(milliseconds: 200),
                                          delay:
                                              const Duration(milliseconds: 200),
                                          child: InkWell(
                                            onTap: () => Get.to(
                                                () =>
                                                    NotificationDetailsMobilePortrait(
                                                      nId: body
                                                          .body
                                                          .notifications[
                                                              position]
                                                          .id,
                                                      title: body
                                                          .body
                                                          .notifications[
                                                              position]
                                                          .event
                                                          .title,
                                                      image: body
                                                                  .body
                                                                  .notifications[
                                                                      position]
                                                                  .event
                                                                  .title ==
                                                              "reward point"
                                                          ? 'assets/svgs/no_wi.png'
                                                          : body
                                                                      .body
                                                                      .notifications[
                                                                          position]
                                                                      .event
                                                                      .title ==
                                                                  "withdrawal"
                                                              ? 'assets/svgs/no_ou.png'
                                                              : 'assets/svgs/no_in.png',
                                                    ),
                                                transition:
                                                    Transition.rightToLeft),
                                            child: notificationItem(
                                              color: body
                                                          .body
                                                          .notifications[
                                                              position]
                                                          .seen ==
                                                      false
                                                  ? const Color(0XFFFFF7EC)
                                                  : Colors.transparent,
                                              message: body
                                                  .body
                                                  .notifications[position]
                                                  .content,
                                              timeAgo: timeAgo(body
                                                  .body
                                                  .notifications[position]
                                                  .createdAt),
                                              image: body
                                                          .body
                                                          .notifications[
                                                              position]
                                                          .event
                                                          .title ==
                                                      "reward point"
                                                  ? 'assets/svgs/no_wi.png'
                                                  : body
                                                              .body
                                                              .notifications[
                                                                  position]
                                                              .event
                                                              .title ==
                                                          "withdrawal"
                                                      ? 'assets/svgs/no_ou.png'
                                                      : 'assets/svgs/no_in.png',
                                            ),
                                          ),
                                        );
                                      },
                                    );
                            }
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 104.0),
                                child: CupertinoActivityIndicator(
                                  color: Color(0xffFE7A01),
                                  // strokeWidth: 3,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget notificationItem({
    message,
    timeAgo,
    image,
    color,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 38,
                width: 38,
                child: Image.asset(
                  image,
                ),
              )
            ],
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
