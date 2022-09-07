import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jekawin_mobile_flutter/app/widgets/fade_in_animations.dart';
import '../../controllers/redeem_prizes_controller.dart';
import '../../models/view_particular_winning_prize_item_model.dart';

class ViewPrizeItem extends StatelessWidget {
  ViewPrizeItem({Key? key, required this.prizeID}) : super(key: key);

  final String prizeID;
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
            // expandedHeight: 104.0,
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
            stretch: true,
            floating: true,
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      top: 18.0,
                      bottom: 12.0,
                    ),
                    child: FutureBuilder<ViewWinningPrizeItemModel?>(
                      future: controller.getAParticularWinningPrize(
                        key,
                        prizeId: prizeID,
                      ),
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
                          ViewWinningPrizeItemModel body = snapshot.data!;
                          return FadeIn(
                            duration: const Duration(milliseconds: 200),
                            delay: const Duration(milliseconds: 200),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  body.data!.prize!.title,
                                  style: GoogleFonts.mulish(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    height: 1.8,
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Container(
                                  height: Get.height * .24,
                                  width: Get.height * .24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: Colors.grey.shade200,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(24),
                                    child: Image.network(
                                        body.data!.prize!.imageUrl),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Address: ',
                                      style: GoogleFonts.mulish(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        height: 1.8,
                                      ),
                                    ),
                                    Text(
                                      body.data!.delivery!.address,
                                      style: GoogleFonts.mulish(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        height: 1.8,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Phone number: ',
                                      style: GoogleFonts.mulish(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        height: 1.8,
                                      ),
                                    ),
                                    Text(
                                      body.data!.delivery!.phoneNumber,
                                      style: GoogleFonts.mulish(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        height: 1.8,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Delivery date: ',
                                      style: GoogleFonts.mulish(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        height: 1.8,
                                      ),
                                    ),
                                    Text(
                                      'Between ${DateFormat("MMMM d").format(body.data!.dateRedeemed!)} - ${DateFormat("MMMM d").format(body.data!.dateRedeemed!.add(const Duration(days: 7)))}',
                                      style: GoogleFonts.mulish(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        height: 1.8,
                                      ),
                                    ),
                                  ],
                                )
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
}
