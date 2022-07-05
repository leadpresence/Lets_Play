import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jekawin_mobile_flutter/app/modules/fund_wallet/controllers/complete_funding_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../config/themes/app_theme_constants.dart';
import '../../../../widgets/custom_large_button.dart';
import '../../../jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';

class CompleteFundingWebView extends StatelessWidget {
  String? url;
  @override
  final CompleteFundingController controller =
      Get.put(CompleteFundingController());

  CompleteFundingWebView({Key? key, this.themeData, this.customAppTheme})
      : super(key: key);
  final ThemeData? themeData;
  final CustomAppTheme? customAppTheme;

  @override
  Widget build(BuildContext context) {
    var link = GetStorage().read("paymentLink");

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Fund Wallet",
            overflow: TextOverflow.ellipsis,
          ),
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
          actions: [
            Padding(
                padding: const EdgeInsets.only(left: 16.0 ,right: 16.0),
                child: GestureDetector(
                  child: const Text(
                    "Done",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  onTap: () {
                    Get.offAll(
                      () => const JekawinBottomTabs(
                        tabIndex: 0,
                        isGuestUser: true,
                      ),
                      transition: Transition.cupertino,
                    );
                  },
                )),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 0.0,
          ),
          child:

              WebView(
            javascriptMode: JavascriptMode.unrestricted,
            onProgress: (k) {
              const CircularProgressIndicator();
            },
            initialUrl: '$link',
          ),

        ));
  }
}
