import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/select_account/controller/select_bank_controller.dart';

import '../../../../config/themes/app_theme_constants.dart';
import '../../../../constants/asset_paths.dart';

class SelectBankMobilePortrait extends GetView {
  @override
  final SelectBankController controller = Get.put(SelectBankController());

  SelectBankMobilePortrait({Key? key, this.themeData, this.customAppTheme})
      : super(key: key);
  final ThemeData? themeData;
  final CustomAppTheme? customAppTheme;

  @override
  Widget build(BuildContext context) {
    screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
    screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
    final Widget addBankIcon = SvgPicture.asset(
      addBank,
      width: 30,
      height: 30,
    );
    return
        // Obx(() =>
        Scaffold(
            body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Select  Account",
                style: TextStyle(
                    fontWeight: FontWeight.w200, // light
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                    fontSize: 24 // italic
                    ),
              )
            ],
          ),
          const Gap(30),
          //  Add new bank account
          Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  addBankIcon,
                  const Gap(15),
                  SizedBox(
                    child: Text(
                      "Add new bank account",
                      overflow: TextOverflow.ellipsis,
                    ),
                    width: screenWidth(context) / 2,
                  ),
                ],
              )),
          const Gap(5),
          Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                  height: screenHeight(context) / 2 + 130,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: -12,
                        offset: const Offset(0, 10),
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 25,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int position) {
                        return BankItem();
                      })))
        ],
      ),
    ));
  }
}



//Todo @felix create needed para meters for this class
class BankItem extends StatelessWidget {
  BankItem();

  @override
  Widget build(BuildContext context) {
    screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
    screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

    final Widget binIcon = SvgPicture.asset(
      bin,
      width: 14,
      height: 14,
    );
    final Widget bankIcon = SvgPicture.asset(
      bank,
      width: 30,
      height: 30,
    );
    final Widget addBankIcon = SvgPicture.asset(
      addBank,
      width: 30,
      height: 30,
    );
    return Container(
      padding: const EdgeInsets.all(10),
      height: screenHeight(context) / 9,
      margin: const EdgeInsets.fromLTRB(8, 9, 8, 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFE7A01).withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bankIcon,
            ],
          ),
          const Gap(28),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //bank name
              SizedBox(
                child: Text("UBA"),
                width: screenWidth(context) / 2,
              ),
              const Gap(8),
              //account number
              SizedBox(
                child: Text("1234567890", overflow: TextOverflow.ellipsis),
                width: screenWidth(context) / 2,
              ),
              const Gap(8),
              //Name
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Text(
                        "George Adejumoke Rachael Adejumoke Rachael",
                        overflow: TextOverflow.ellipsis,
                      ),
                      width: screenWidth(context) / 2,
                    ),
                    Gap(screenWidth(context) / 16),
                    GestureDetector(
                      child: binIcon,
                      onTap: () {},
                    )
                  ])
            ],
          )
        ],
      ),
    );
  }
}
