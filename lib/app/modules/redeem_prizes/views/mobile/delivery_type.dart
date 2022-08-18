import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/custom_large_button.dart';
import '../../controllers/redeem_prizes_controller.dart';
import 'add_delivery_details.dart';

class DeliveryType extends StatelessWidget {
  DeliveryType({Key? key, required this.prizeID}) : super(key: key);

  final RedeemPrizesController controller = Get.put(RedeemPrizesController());
  final String prizeID;

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
                  Get.back();
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
                  'Delivery Type',
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
                return Obx(
                  () => SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                        top: 18.0,
                        bottom: 12.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          toggleBody(),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: CustomButton(
                              buttonText: "Continue",
                              onPressed: () {
                                Get.to(
                                  () => AddDeliveryDetails(
                                    prizeID: prizeID,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
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

  toggleBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomCheckBox(
              value: controller.checkDelivery.value,
              splashRadius: 16,
              shouldShowBorder: true,
              borderColor: const Color(0xffFE7A01),
              checkedFillColor: Colors.transparent,
              borderRadius: 4,
              checkedIcon: Icons.check,
              checkedIconColor: const Color(0xffFE7A01),
              borderWidth: 1,
              checkBoxSize: 14,
              onChanged: (val) {
                controller.deliveryToggle();
              },
            ),
            const Text(
              'Delivery',
              style: TextStyle(
                color: Color(0XFF414249),
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            CustomCheckBox(
              value: controller.checkPickUp.value,
              splashRadius: 16,
              shouldShowBorder: true,
              borderColor: const Color(0xffFE7A01),
              checkedFillColor: Colors.white,
              borderRadius: 4,
              checkedIcon: Icons.check,
              checkedIconColor: const Color(0xffFE7A01),
              borderWidth: 1,
              checkBoxSize: 14,
              onChanged: (val) {
                controller.pickUpToggle();
              },
            ),
            const Text(
              'Pick up',
              style: TextStyle(
                color: Color(0XFF414249),
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
