import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/controllers/e_shop_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/views/mobile/my_cart.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_large_button.dart';
import '../../controllers/e_shop_details_controller.dart';
import '../../models/e_shop_default_page_model.dart';

class EShopDetailsMobilePortrait extends GetView<EShopController> {
  final EShopController eShopController = Get.put(EShopController());
  final EShopDetailsController eShopDetailsController =
      Get.put(EShopDetailsController());
  final productDetail;
  // ignore: use_key_in_widget_constructors
  EShopDetailsMobilePortrait({
    required this.productDetail,
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
                    for (int i = 0; i < productDetail!.images!.length; i++)
                      Image.network(
                        productDetail!.images![i],
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
                    for (int i = 0; i < productDetail!.images!.length; i++)
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: CircleAvatar(
                            backgroundColor: controller.color1.value,
                            radius: Get.height >= 799 ? 3 : 2,
                          ),
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
                  splashRadius: 24,
                  icon: SvgPicture.asset(
                    'assets/svgs/chevronLeft.svg',
                    color: const Color(0xff12121D),
                  ),
                  onPressed: () {
                    Get.back();
                    Future.delayed(
                      const Duration(seconds: 1),
                      () => {
                        eShopController.buttonText.value = "Add to cart",
                        eShopController.isSuccess.value = false,
                      },
                    );
                  },
                ),
                IconButton(
                  splashRadius: 24,
                  icon: SvgPicture.asset(
                    'assets/svgs/Group.svg',
                    color: const Color(0xff12121D),
                  ),
                  onPressed: () => eShopController.addToWishList(
                    key,
                    productId: productDetail!.id,
                  ),
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
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Row(
                        //   children: [
                        //     SvgPicture.asset('assets/svgs/star_.svg'),
                        //     const SizedBox(
                        //       width: 4,
                        //     ),
                        //     SvgPicture.asset('assets/svgs/star_.svg'),
                        //     const SizedBox(
                        //       width: 4,
                        //     ),
                        //     SvgPicture.asset('assets/svgs/star_.svg'),
                        //     const SizedBox(
                        //       width: 4,
                        //     ),
                        //     SvgPicture.asset('assets/svgs/star_.svg'),
                        //     const SizedBox(
                        //       width: 4,
                        //     ),
                        //     SvgPicture.asset(
                        //       'assets/svgs/star_.svg',
                        //       color: const Color(0xffDADEE3),
                        //     ),
                        //     const SizedBox(
                        //       width: 8,
                        //     ),
                        //     const Text('4.0'),
                        //   ],
                        // ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        Text(
                          productDetail!.title,
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          "₦ ${productDetail!.price.toString()}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFFFE7A01),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 44,
                    child: GetBuilder<EShopDetailsController>(
                      init: EShopDetailsController(),
                      builder: (context) => ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: productDetail!.sizes!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          eShopDetailsController.currentSize.value =
                              productDetail!.sizes![0];
                          return Obx(
                            () => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: InkWell(
                                onTap: () {
                                  eShopDetailsController.currentSize.value =
                                      productDetail!.sizes![index];
                                  if (kDebugMode) {
                                    print(eShopDetailsController
                                        .currentSize.value);
                                  }
                                },
                                child: DottedBorder(
                                  color: eShopDetailsController
                                              .currentSize.value ==
                                          productDetail!.sizes![index]
                                      ? const Color(0XFFFE7A01)
                                      : const Color(0xff747B84),
                                  borderType: BorderType.RRect,
                                  dashPattern: eShopDetailsController
                                              .currentSize.value ==
                                          productDetail!.sizes![index]
                                      ? const [500, 500]
                                      : const [4, 4],
                                  radius: const Radius.circular(8),
                                  strokeWidth: eShopDetailsController
                                              .currentSize.value ==
                                          productDetail!.sizes![index]
                                      ? .8
                                      : .8,
                                  child: SizedBox(
                                    height: 44,
                                    width: 52,
                                    child: Center(
                                      child: Text(
                                        productDetail!.sizes![index],
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: eShopDetailsController
                                                      .currentSize.value ==
                                                  productDetail!.sizes![index]
                                              ? const Color(0XFFFE7A01)
                                              : const Color(0xff747B84),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24.0,
                      right: 24.0,
                      top: 48.0,
                    ),
                    child: Column(
                      children: [
                        Obx(
                          () => CustomButton(
                            shadowColor: eShopController.isSuccess.value == true
                                ? Colors.black
                                : Colors.white,
                            onPrimary: eShopController.isSuccess.value == true
                                ? Colors.black
                                : Colors.white,
                            buttonColor: eShopController.isSuccess.value == true
                                ? Colors.white
                                : const Color(0xFFFE7A01),
                            hasBorder: eShopController.isSuccess.value == true
                                ? true
                                : false,
                            borderColor: eShopController.isSuccess.value == true
                                ? const Color(0xFFFE7A01)
                                : Colors.white,
                            hasIcon: eShopController.isSuccess.value == true
                                ? false
                                : eShopController.isLoading.value == false
                                    ? true
                                    : false,
                            buttonTextColor:
                                eShopController.isSuccess.value == true
                                    ? const Color(0xFFFE7A01)
                                    : Colors.white,
                            isLoading: eShopController.isLoading.value,
                            buttonText: eShopController.buttonText.value,
                            onPressed: eShopController.isSuccess.value == true
                                ? () {
                                    Get.off(() => MyCart(),
                                        transition: Transition.fadeIn);
                                    Future.delayed(
                                      const Duration(seconds: 1),
                                      () => {
                                        eShopController.buttonText.value =
                                            "Add to cart",
                                        eShopController.isSuccess.value = false,
                                      },
                                    );
                                  }
                                : () {
                                    controller.addToCart(
                                      quantity: 1,
                                      productId: productDetail!.id,
                                      currentSize: eShopDetailsController
                                          .currentSize.value,
                                    );
                                  },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
