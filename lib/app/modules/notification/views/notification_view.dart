import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../controllers/notification_controller.dart';
import 'mobile/notifications_mobile_portrait.dart';


class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ScreenTypeLayout.builder(

        mobile: (_) => OrientationLayoutBuilder(

          portrait: (_)=>  NotificationMobilePortrait(),
          landscape: (_)=>  NotificationMobilePortrait(),
        ),

        tablet: (_) => OrientationLayoutBuilder(

          portrait: (_) =>  NotificationMobilePortrait(),
          landscape: (_)=> NotificationMobilePortrait(),

        ));
  }
}