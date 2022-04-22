import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/controllers/e_shop_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/views/mobile/success_or_failure_mobile_view.dart';

import '../../../../widgets/custom_large_button.dart';
import '../../../jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';

class EShopDebitCardPaymentMobileView extends GetView<EShopController> {
  final String image, itemName, itemAmount;
  const EShopDebitCardPaymentMobileView(
      this.image, this.itemName, this.itemAmount,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              top: 28.0,
            ),
            height: 108,
            // width: Get.width,
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/svgs/chevronLeft.svg',
                color: const Color(0xff12121D),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: 32.0,
                    right: 12.0,
                  ),
                  child: Text(
                    'Previously Used Cards',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      letterSpacing: .2,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                debitCardCard(),
                debitCardCard(
                  isNewCard: true,
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: CustomButton(
                    hasIcon: false,
                    buttonText: 'Continue',
                    onPressed: () => Get.to(
                      () => const SuccessOrFailureMobileView(
                        msg: 'Your order was successful',
                        className: JekawinBottomTabs(
                          tabIndex: 3,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  debitCardCard({isNewCard = false}) {
    return Container(
      margin: const EdgeInsets.only(
        right: 32,
        left: 32,
        top: 8,
        bottom: 8,
      ),
      padding: isNewCard ? const EdgeInsets.all(20) : const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0XFFDADEE3),
          width: 1,
        ),
      ),
      child: isNewCard
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/svgs/card__.svg'),
                    const SizedBox(
                      width: 32,
                    ),
                    const Text(
                      '+ Add New Card',
                      style: TextStyle(fontSize: 14, color: Color(0xff414249)),
                    )
                  ],
                ),
                SvgPicture.asset(
                  'assets/svgs/check.svg',
                  color: const Color(0XFFDADEE3),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/jpgs/Image.jpg'),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Top Up Method - Master Card',
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff747B84)),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          '+ Add New Card',
                          style:
                              TextStyle(fontSize: 14, color: Color(0xff414249)),
                        ),
                      ],
                    )
                  ],
                ),
                SvgPicture.asset('assets/svgs/check.svg'),
              ],
            ),
    );
  }
}
