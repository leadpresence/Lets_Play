import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../widgets/custom_large_button.dart';
import '../../../jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';

class MessagesMobileLandscape extends StatelessWidget {
  final nextRoute, messageString;
  final bool status;

  MessagesMobileLandscape(
      {Key? key, this.nextRoute, this.messageString, required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              status
                  ? SvgPicture.asset('assets/svgs/success_check.svg')
                  : SvgPicture.asset('assets/svgs/message_error.svg'),
              const SizedBox(
                height: 24,
              ),
              status
                  ?
                  //successful
                  Text(messageString ?? 'Your request was successful',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xFF4E4B66),
                      ))
                  :
                  //failed
                  Text(
                      messageString ??
                          'Something went wrong ,\nplease try again.',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xFF4E4B66),
                      ),
                    ),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                ),
                child: CustomButton(
                  onPressed: () =>
                      nextRoute ??
                      Get.to(
                        () => const JekawinBottomTabs(
                          tabIndex: 3,
                        ),
                        transition: Transition.cupertino,
                      ),
                  buttonText: 'Done',
                ),
              )
            ]),
      ),
    );
  }
}
