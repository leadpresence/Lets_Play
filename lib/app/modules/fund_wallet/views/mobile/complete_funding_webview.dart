import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../config/themes/app_theme_constants.dart';
import '../../../wallet_home/controllers/wallet_home_controller.dart';

class CompleteFundingWebView extends StatelessWidget {
  String? url;
  @override
  final WalletHomeController controller = Get.put(WalletHomeController());

  CompleteFundingWebView(
      {Key? key, required url, this.themeData, this.customAppTheme})
      : super(key: key);
  final ThemeData? themeData;
  final CustomAppTheme? customAppTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.deepOrange,
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
                  top: 4.0,
                ),
                child: Column(
                  children: [
                    WebView(
                      initialUrl: '$url',
                    )
                  ],
                ))));
  }
}
