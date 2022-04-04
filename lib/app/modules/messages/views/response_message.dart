import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/messages/views/mobile/messages_mobile_landscape.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../contllers/messages_controllers.dart';
import 'mobile/messages_mobile_portrait.dart';
/*
 * this class is used to show user the response or state of the request
 * made with all authentication classes
 **/


class ResponseMessageView extends GetView<MessagesController> {
  final nextRoute,messageString;
  final bool status ;
  const ResponseMessageView({Key? key, this.nextRoute,  this.messageString,required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ScreenTypeLayout.builder(
        mobile: (_) => OrientationLayoutBuilder(

          portrait: (_)=> const MessagesMobilePortrait(nextRoute:nextRoute,messageString:messageString,status: status,),
          landscape: (_)=>const MessagesMobileLandscape(nextRoute:nextRoute,messageString:messageString,status: status,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ),
        ),
        tablet: (_) => OrientationLayoutBuilder(
          portrait: (_) => const   LoginTabletPortrait(),
          landscape: (_)=>
          const LoginTabletLandscape(),

        ));
  }
}