import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../config/themes/app_theme_constants.dart';

class WalletHomeMobilePortrait extends GetView {
  const WalletHomeMobilePortrait(
      {Key? key, this.themeData, this.customAppTheme}) : super(key: key);
  final ThemeData? themeData;
  final CustomAppTheme? customAppTheme;

  @override
  Widget build(BuildContext context) {
    screenWidth(BuildContext context) =>
        MediaQuery
            .of(context)
            .size
            .width;
    screenHeight(BuildContext context) =>
        MediaQuery
            .of(context)
            .size
            .height;

    return Obx(() =>
        Scaffold(
            body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0,10,16.0,10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                 Container(

                   width: double.infinity
                   ,height: screenWidth(context)*0.05,
                   child: Column(
                     children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Withdrawal Balance :"),
                          const Gap(8),
                          const Text("₦ 0.0:"),
                        ],)
                     ],
                   ),
                   decoration: const BoxDecoration(
                     color: Colors.deepPurple,

                       borderRadius: BorderRadius.all(Radius.circular(16.0)),

                   ),
                 )

                      ],
                  ),
                )
            )
        ));
    }
}

