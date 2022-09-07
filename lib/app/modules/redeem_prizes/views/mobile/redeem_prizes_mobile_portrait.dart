import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jekawin_mobile_flutter/app/modules/jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';
import 'package:jekawin_mobile_flutter/app/modules/redeem_prizes/controllers/redeem_prizes_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/redeem_prizes/views/mobile/view_prize_item.dart';

import '../../../../widgets/custom_large_button.dart';
import '../../../../widgets/fade_in_animations.dart';
import '../../models/user_game_prize_model.dart';
import 'delivery_type.dart';

class RedeemPrizesMobilePortrait extends StatelessWidget {
  RedeemPrizesMobilePortrait({Key? key}) : super(key: key);

  final RedeemPrizesController controller = Get.put(RedeemPrizesController());

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
                  Get.off(
                    () => JekawinBottomTabs(
                      tabIndex: 4,
                    ),
                    transition: Transition.topLevel,
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
                  'Redeem prize',
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
                    child: FutureBuilder<PlayerPrizesResponse?>(
                      future: controller.getPlayerPrizes(key),
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
                          return body.body!.isEmpty
                              ? Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/package.png',
                                      width: Get.width * .7,
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    const Text(
                                      'You don’t have any prize yet',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff414249),
                                      ),
                                    ),
                                  ],
                                )
                              : ListView.builder(
                                  reverse: true,
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: body.body!.length,
                                  itemBuilder:
                                      (BuildContext context, int position) {
                                    return FadeIn(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      delay: const Duration(milliseconds: 200),
                                      child: redeemPrizeCard(
                                        image: body
                                            .body![position].prize!.imageUrl,
                                        itemName:
                                            body.body![position].prize!.title,
                                        onPressClaimPrize: () {
                                          body.body![position].isRedeemed ==
                                                  false
                                              ? Get.to(
                                                  () => DeliveryType(
                                                    prizeID:
                                                        body.body![position].id,
                                                  ),
                                                )
                                              : Get.to(
                                                  () => ViewPrizeItem(
                                                    prizeID:
                                                        body.body![position].id,
                                                  ),
                                                );
                                        },
                                        buttonText:
                                            body.body![position].isRedeemed ==
                                                    false
                                                ? 'Claim Prize'
                                                : 'View Item',
                                        buttonColor:
                                            body.body![position].isRedeemed ==
                                                    false
                                                ? const Color(0xFFFE7A01)
                                                : Colors.white,
                                        borderColor: const Color(0xFFFE7A01),
                                        buttonTextColor:
                                            body.body![position].isRedeemed ==
                                                    false
                                                ? Colors.white
                                                : const Color(0xFFFE7A01),
                                        hasBorder:
                                            body.body![position].isRedeemed ==
                                                    false
                                                ? false
                                                : true,
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

  Widget redeemPrizeCard({
    image,
    itemName,
    onPressClaimPrize,
    buttonText,
    buttonColor = const Color(0xFFFE7A01),
    borderColor = const Color(0xFFFE7A01),
    buttonTextColor = Colors.white,
    hasBorder = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Get.height * .105,
            width: Get.height * .105,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.grey.shade200,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(image),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemName,
                style: GoogleFonts.mulish(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  height: 1.8,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: Get.width * .32,
                child: CustomButton(
                  borderRadius: 8,
                  height: 28.0,
                  fontSize: 10,
                  onPressed: onPressClaimPrize,
                  buttonText: buttonText,
                  hasBorder: hasBorder,
                  buttonColor: buttonColor,
                  borderColor: borderColor,
                  buttonTextColor: buttonTextColor,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
