import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jekawin_mobile_flutter/app/modules/notification/models/notification_detail_model.dart';
import 'package:jekawin_mobile_flutter/app/modules/notification/views/mobile/notifications_mobile_portrait.dart';

import '../../controllers/notification_controller.dart';

class NotificationDetailsMobilePortrait extends StatelessWidget {
  NotificationDetailsMobilePortrait({
    Key? key,
    required this.nId,
    required this.title,
    required this.image,
  }) : super(key: key);

  final String nId, title, image;

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
              Get.to(
                () => NotificationMobilePortrait(),
                transition: Transition.leftToRight,
              );
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(
              24,
            ),
            FutureBuilder<NotificationDetailModel?>(
              future: controller.getNotificationDetail(key, nId),
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
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24.0),
                    padding: const EdgeInsets.all(16.0),
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: const Color(0XFFFFF7EC),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            SizedBox(
                              height: 38,
                              width: 38,
                              child: Image.asset(
                                image,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              title.capitalize!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0XFF414249),
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                                letterSpacing: -.2,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            const Text(
                              'Amount:',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0XFF414249),
                                fontSize: 16,
                                height: 1.4,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              "",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0XFF414249),
                                fontSize: 14,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Text(
                              'Date:',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0XFF414249),
                                fontSize: 16,
                                height: 1.4,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              DateFormat('dd/MM/yy').format(
                                DateTime.parse(
                                  body.body.notification.createdAt.toString(),
                                ),
                              ),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0XFF414249),
                                fontSize: 14,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Text(
                              'Time:',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0XFF414249),
                                fontSize: 16,
                                height: 1.4,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              DateFormat('hh:mm').format(
                                DateTime.parse(
                                  body.body.notification.createdAt.toString(),
                                ),
                              ),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0XFF414249),
                                fontSize: 14,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
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
  }
}
