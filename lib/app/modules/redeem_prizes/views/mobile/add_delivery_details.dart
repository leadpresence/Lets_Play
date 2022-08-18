import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/custom_large_button.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../../widgets/slide_in_animation.dart';
import '../../controllers/redeem_prizes_controller.dart';

class AddDeliveryDetails extends StatelessWidget {
  AddDeliveryDetails({
    Key? key,
    required this.prizeID,
  }) : super(key: key);

  final String prizeID;

  final RedeemPrizesController controller = Get.put(RedeemPrizesController());
  final TextStyle errorTextStyle = const TextStyle(
    fontSize: 10,
    color: Colors.deepOrange,
    letterSpacing: .2,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'Add your delivery details',
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
                      top: 24,
                      bottom: 12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        formBody(),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Obx(
                            () => CustomButton(
                              isLoading: controller.isLoading.value,
                              buttonText: "Continue",
                              onPressed: () {
                                controller.deliveryDetailsValidator(
                                  key,
                                  prizeId: prizeID,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
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

  Widget formBody() {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SlideInAnimation(
              duration: const Duration(milliseconds: 100),
              child: CustomTextField(
                hintText: "Delivery Address",
                textCapitalization: TextCapitalization.words,
                textController: controller.deliveryAddress,
                keyboardType: TextInputType.text,
                onChanged: (v) {
                  if (v.isNotEmpty) {
                    controller.clearErrorDeliveryAddress();
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 4, 24, 12),
            child: Text(
              controller.errorDeliveryAddressMessage.value,
              style: errorTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SlideInAnimation(
              duration: const Duration(milliseconds: 100),
              child: CustomTextField(
                hintText: "Delivery Phone Number",
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.phone,
                textController: controller.deliveryPhone,
                onChanged: (v) {
                  if (v.isNotEmpty) {
                    controller.clearErrorDeliveryPhone();
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 4, 24, 12),
            child: Text(
              controller.errorDeliveryPhoneMessage.value,
              style: errorTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SlideInAnimation(
              duration: const Duration(milliseconds: 100),
              child: CustomTextField(
                hintText: "Comment",
                keyboardType: TextInputType.text,
                textController: controller.comment,
                onChanged: (v) {
                  if (v.isNotEmpty) {
                    controller.clearErrorComment();
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Text(
              controller.errorCommentMessage.value,
              style: errorTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
