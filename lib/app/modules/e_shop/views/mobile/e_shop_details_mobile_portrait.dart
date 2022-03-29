import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/controllers/e_shop_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/views/mobile/e_shop_make_payment.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_large_button.dart';

class EShopDetailsMobilePortrait extends GetView<EShopController> {
  final EShopController eShopController = Get.put(EShopController());
  final String image, itemAmount, itemName;
  // ignore: use_key_in_widget_constructors
  EShopDetailsMobilePortrait({
    required this.image,
    required this.itemAmount,
    required this.itemName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              SizedBox(
                height: Get.height * .58,
                child: PageView(
                  controller: eShopController.controller,
                  children: [
                    Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(
                      () => CircleAvatar(
                        backgroundColor: controller.color1.value,
                        radius: Get.height >= 799 ? 3 : 2,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Obx(
                      () => CircleAvatar(
                        backgroundColor: controller.color2.value,
                        radius: Get.height >= 799 ? 3 : 2,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Obx(
                      () => CircleAvatar(
                        backgroundColor: controller.color3.value,
                        radius: Get.height >= 799 ? 3 : 2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 28.0,
            ),
            height: 108,
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/svgs/chevronLeft.svg',
                    color: const Color(0xff12121D),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/svgs/Group.svg',
                    color: const Color(0xff12121D),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Get.height * .48,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/svgs/star_.svg'),
                        const SizedBox(
                          width: 4,
                        ),
                        SvgPicture.asset('assets/svgs/star_.svg'),
                        const SizedBox(
                          width: 4,
                        ),
                        SvgPicture.asset('assets/svgs/star_.svg'),
                        const SizedBox(
                          width: 4,
                        ),
                        SvgPicture.asset('assets/svgs/star_.svg'),
                        const SizedBox(
                          width: 4,
                        ),
                        SvgPicture.asset(
                          'assets/svgs/star_.svg',
                          color: const Color(0xffDADEE3),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text('4.0'),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      itemName,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      itemAmount,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFFFE7A01),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomButton(
                      hasIcon: true,
                      buttonText: 'Add to cart',
                      onPressed: () => Get.to(() => EShopMakePaymentMobileView(
                          image, itemName, itemAmount)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
