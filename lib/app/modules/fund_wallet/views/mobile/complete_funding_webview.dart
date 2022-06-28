import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../config/themes/app_theme_constants.dart';
import '../../../wallet_home/controllers/wallet_home_controller.dart';

class CompleteFundingWebView extends StatelessWidget {
  String? url;
  @override
  final WalletHomeController controller = Get.put(WalletHomeController());
  CompleteFundingWebView(
      {Key? key, this.themeData, this.customAppTheme})
      : super(key: key);
  final ThemeData? themeData;
  final CustomAppTheme? customAppTheme;

  @override
  Widget build(BuildContext context) {
    var link = GetStorage().read("paymentLink");

    return Scaffold(
        backgroundColor: Colors.white,
        appBar:
        AppBar(
          centerTitle: true,
          title: const Text("Fund Wallet",overflow: TextOverflow.ellipsis,),
          elevation: 0,
          backgroundColor: Colors.orange,
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
        body: Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: 4.0,
            ),
            child:
                WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  onProgress: (k){
                    const CircularProgressIndicator();
                  },
                  initialUrl: '$link',
                )

        ));
  }
}
