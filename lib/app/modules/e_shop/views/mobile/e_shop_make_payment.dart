import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/controllers/e_shop_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/controllers/e_shop_make_payment_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/views/mobile/e_shop_debit_card_payment.dart';

import '../../../../widgets/custom_large_button.dart';

class EShopMakePaymentMobileView extends GetView<EShopController> {
  final String image, itemName, itemAmount;
  EShopMakePaymentMobileView(this.image, this.itemName, this.itemAmount,
      {Key? key})
      : super(key: key);

  final EShopMakePaymentController eShopMakePaymentController =
      Get.put(EShopMakePaymentController());

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
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
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
              ),
              const SizedBox(
                height: 32,
              ),
            ],
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
                  height: 24,
                ),
                Text(
                  '20, Law Close Magodo',
                  style: TextStyle(
                    color: Color(0XFF414249),
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 24,
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
              left: 16.0,
              top: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomCheckBox(
                      value: eShopMakePaymentController.checkDelivery.value,
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
                        eShopMakePaymentController.deliveryToggle();
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
                Row(
                  children: [
                    CustomCheckBox(
                      value: eShopMakePaymentController.checkPickUp.value,
                      splashRadius: 16,
                      shouldShowBorder: true,
                      borderColor: const Color(0xffFE7A01),
                      checkedFillColor: Colors.white,
                      borderRadius: 4,
                      borderWidth: 1,
                      checkBoxSize: 14,
                      onChanged: (val) {
                        eShopMakePaymentController.deliveryToggle();
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
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 32.0,
              right: 12.0,
              top: 24.0,
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
              left: 16.0,
              // right: 32.0,
              top: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomCheckBox(
                      value: eShopMakePaymentController.checkRewardPoints.value,
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
                        eShopMakePaymentController.rewardPointsToggle();
                      },
                    ),
                    const Text(
                      'Reward points',
                      style: TextStyle(
                        color: Color(0XFF414249),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomCheckBox(
                      value: eShopMakePaymentController.checkDebitCard.value,
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
                        eShopMakePaymentController.debitCardToggle();
                      },
                    ),
                    const Text(
                      'Debit card',
                      style: TextStyle(
                        color: Color(0XFF414249),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: CustomButton(
              hasIcon: false,
              buttonText: 'Proceed',
              onPressed: () => Get.to(() =>
                  EShopDebitCardPaymentMobileView(image, itemName, itemAmount)),
            ),
          )
        ],
      ),
    );
  }
}
