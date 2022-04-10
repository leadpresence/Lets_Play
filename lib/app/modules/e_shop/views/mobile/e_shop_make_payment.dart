import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/controllers/e_shop_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/views/mobile/e_shop_debit_card_payment.dart';

import '../../../../widgets/custom_large_button.dart';

class EShopMakePaymentMobileView extends GetView<EShopController> {
  final String image, itemName, itemAmount;
  const EShopMakePaymentMobileView(this.image, this.itemName, this.itemAmount,
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
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              shrinkWrap: true,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 62,
                      width: 69,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(image),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          itemName,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          itemAmount,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFFFE7A01),
                          ),
                        ),
                      ],
                    )
                  ],
                ) ,
                const SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 32.0,
              right: 12.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Delivery Information',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .2,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0XFFFE7A01),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 32.0,
              right: 32.0,
              top: 4.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '09027583645',
                  style: TextStyle(
                    color: Color(0XFF414249),
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  '20, Law Close Magodo',
                  style: TextStyle(
                    color: Color(0XFF414249),
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Lagos, Nigeria.',
                  style: TextStyle(
                    color: Color(0XFF414249),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 32.0,
              right: 12.0,
              top: 32.0,
            ),
            child: Text(
              'Delivery Type',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: .2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 32.0,
              right: 32.0,
              top: 18.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Delivery',
                  style: TextStyle(
                    color: Color(0XFF414249),
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Pick up',
                  style: TextStyle(
                    color: Color(0XFF414249),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 32.0,
              right: 12.0,
              top: 32.0,
            ),
            child: Text(
              'Payment Type',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: .2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 32.0,
              right: 32.0,
              top: 18.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Reward points',
                  style: TextStyle(
                    color: Color(0XFF414249),
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Debit card',
                  style: TextStyle(
                    color: Color(0XFF414249),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: CustomButton(
              hasIcon: false,
              buttonText: 'Make Payment',
              onPressed: () => Get.to(() =>
                  EShopDebitCardPaymentMobileView(image, itemName, itemAmount)),
            ),
          )
        ],
      ),
    );
  }
}
