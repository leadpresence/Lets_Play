import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/controllers/e_shop_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/controllers/e_shop_make_payment_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/views/mobile/e_shop_debit_card_payment.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/views/mobile/edit_delivery_information.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/views/mobile/my_cart.dart';
import '../../../../widgets/custom_large_button.dart';
import '../../../../widgets/fade_in_animations.dart';
import '../../../fund_wallet/views/fund_wallet_view.dart';
import '../../../wallet_home/controllers/wallet_home_controller.dart';
import '../../models/my_cart_model.dart';

class EShopMakePaymentMobileView extends GetView<EShopController> {
  final EShopMakePaymentController eShopMakePaymentController =
      Get.put(EShopMakePaymentController());
  final EShopController eShopController = Get.put(EShopController());

  EShopMakePaymentMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        color: const Color(0xFFFE7A01),
        onRefresh: () => eShopController.getMyCartItems(),
        child: CustomScrollView(
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
                      () => MyCart(),
                      transition: Transition.leftToRight,
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
                    "Checkout",
                    style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600, // light
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                      fontSize: 20, // italic
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, int index) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            right: 16.0,
                            top: 12,
                            bottom: 12,
                          ),
                          child: FutureBuilder<MyCartModel?>(
                            future: eShopController.getMyCartItems(),
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
                                MyCartModel? data = snapshot.data!;
                                return data.body!.carts!.isEmpty
                                    ? SizedBox(
                                        height: Get.height * .7,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const SizedBox(),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Text(
                                                  "You’re all caught up!",
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    height: 2,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  'You do not have any product in your cart',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    height: 2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            CustomButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              buttonText: 'Continue Shopping',
                                            ),
                                          ],
                                        ),
                                      )
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ListView.builder(
                                            reverse: false,
                                            shrinkWrap: true,
                                            padding: EdgeInsets.zero,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            itemCount: data.body!.carts!.length,
                                            itemBuilder: (BuildContext context,
                                                int position) {
                                              return FadeIn(
                                                duration: const Duration(
                                                    milliseconds: 200),
                                                delay: const Duration(
                                                    milliseconds: 200),
                                                child: InkWell(
                                                  onTap: () => {},
                                                  child: checkOutItem(
                                                    color:
                                                        const Color(0XFFFFF7EC),
                                                    message: data.body!
                                                        .carts![position].title,
                                                    image: data.body!
                                                        .carts![position].image,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          const SizedBox(height: 24),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 12.0,
                                              right: 12.0,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                  onPressed: () {
                                                    Get.to(
                                                      () =>
                                                          EditDeliveryInformationMobilePortrait(),
                                                      transition: Transition
                                                          .rightToLeft,
                                                    );
                                                  },
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
                                              left: 12.0,
                                              right: 12.0,
                                              top: 4.0,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller.phoneText.text,
                                                  style: const TextStyle(
                                                    color: Color(0XFF414249),
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 18,
                                                ),
                                                Text(
                                                  controller
                                                      .homeAddressText.text,
                                                  style: const TextStyle(
                                                    color: Color(0XFF414249),
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 18,
                                                ),
                                                const Text(
                                                  'Nigeria',
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
                                              left: 12.0,
                                              right: 12.0,
                                              top: 36.0,
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
                                          deliveryTypeToggleBody(),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                              left: 12.0,
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
                                          paymentTypeToggleBody(),
                                          const SizedBox(
                                            height: 24,
                                          ),
                                          textInfo(
                                            call: "Subtotal",
                                            res: data.body!.sumTotal.toString(),
                                          ),
                                          textInfo(
                                            call: "Shipping",
                                            res: "Free",
                                          ),
                                          textInfo(
                                            call: "Delivery",
                                            res: "Free",
                                          ),
                                          textInfo(
                                            call: "Discount percentage",
                                            res: "0 %",
                                          ),
                                          const SizedBox(height: 24),
                                          Container(
                                            height: 78,
                                            width: Get.width,
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                  width: .2,
                                                ),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'Sub total :  ₦ ${data.body!.sumTotal}',
                                                  style: GoogleFonts.mulish(
                                                    fontWeight: FontWeight
                                                        .bold, // light
                                                    color: Colors.black,
                                                    fontSize: 20, // italic
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 16.0,
                                              right: 16.0,
                                              bottom: 24.0,
                                              top: 8.0,
                                            ),
                                            child: Expanded(
                                              child: CustomButton(
                                                onPressed: () {
                                                  eShopController
                                                              .selectedDeliveryOption ==
                                                          'debit card'
                                                      ? Get.to(
                                                          () =>
                                                              EShopDebitCardPaymentMobileView(),
                                                          transition: Transition
                                                              .rightToLeft,
                                                        )
                                                      : showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            final WalletHomeController
                                                                walletController =
                                                                Get.put(
                                                                    WalletHomeController());
                                                            return FadeIn(
                                                              duration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          200),
                                                              delay: const Duration(
                                                                  milliseconds:
                                                                      100),
                                                              child: Dialog(
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                elevation: 0.0,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                child:
                                                                    ConstrainedBox(
                                                                  constraints:
                                                                      BoxConstraints(
                                                                          maxWidth:
                                                                              Get.width),
                                                                  child:
                                                                      Container(
                                                                    margin:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        bottom:
                                                                            16.0),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      shape: BoxShape
                                                                          .rectangle,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16),
                                                                      boxShadow: const [
                                                                        BoxShadow(
                                                                          color:
                                                                              Colors.black26,
                                                                          blurRadius:
                                                                              24.0,
                                                                          offset: Offset(
                                                                              0.0,
                                                                              10.0),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min, // To
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center, // make the card compact
                                                                      children: [
                                                                        const SizedBox(
                                                                            height:
                                                                                4.0),
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(
                                                                            left:
                                                                                16.0,
                                                                            right:
                                                                                16.0,
                                                                            top:
                                                                                16.0,
                                                                            bottom:
                                                                                16.0,
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              const SizedBox(),
                                                                              InkWell(
                                                                                onTap: () => Get.back(),
                                                                                child: SvgPicture.asset(
                                                                                  'assets/svgs/cancel.svg',
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                            height:
                                                                                4.0),
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.symmetric(horizontal: 16.0),
                                                                          child:
                                                                              Text(
                                                                            'You\'ll be deducted ₦${data.body!.sumTotal} for this operation',
                                                                            style:
                                                                                const TextStyle(
                                                                              height: 1.8,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                            height:
                                                                                24.0),
                                                                        Obx(
                                                                          () =>
                                                                              SizedBox(
                                                                            width:
                                                                                Get.width * .38,
                                                                            child:
                                                                                CustomButton(
                                                                              isLoading: controller.isLoading.value,
                                                                              height: 40.0,
                                                                              onPressed: () {
                                                                                Get.back();
                                                                                if (walletController.walletBody!.body.wallet.balance < data.body!.sumTotal) {
                                                                                  showDialog(
                                                                                    context: Get.context!,
                                                                                    builder: (BuildContext context) {
                                                                                      return FadeIn(
                                                                                        duration: const Duration(milliseconds: 200),
                                                                                        delay: const Duration(milliseconds: 100),
                                                                                        child: Dialog(
                                                                                          shape: RoundedRectangleBorder(
                                                                                            borderRadius: BorderRadius.circular(10),
                                                                                          ),
                                                                                          elevation: 0.0,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          child: ConstrainedBox(
                                                                                            constraints: BoxConstraints(maxWidth: Get.width),
                                                                                            child: Container(
                                                                                              margin: EdgeInsets.zero,
                                                                                              decoration: BoxDecoration(
                                                                                                color: Colors.white,
                                                                                                shape: BoxShape.rectangle,
                                                                                                borderRadius: BorderRadius.circular(16),
                                                                                                boxShadow: const [
                                                                                                  BoxShadow(
                                                                                                    color: Colors.black26,
                                                                                                    blurRadius: 24.0,
                                                                                                    offset: Offset(0.0, 10.0),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.min,
                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                // To make the card compact
                                                                                                children: [
                                                                                                  const SizedBox(height: 4.0),
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsets.only(
                                                                                                      left: 16.0,
                                                                                                      right: 16.0,
                                                                                                      top: 16.0,
                                                                                                      bottom: 16.0,
                                                                                                    ),
                                                                                                    child: Row(
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        const SizedBox(),
                                                                                                        InkWell(
                                                                                                          onTap: () => Get.back(),
                                                                                                          child: SvgPicture.asset(
                                                                                                            'assets/svgs/cancel.svg',
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  const SizedBox(height: 4.0),
                                                                                                  const Text(
                                                                                                    'Insufficient amount in wallet\nFund wallet to continue.',
                                                                                                    style: TextStyle(height: 1.6),
                                                                                                    textAlign: TextAlign.center,
                                                                                                  ),
                                                                                                  const SizedBox(height: 24.0),
                                                                                                  SizedBox(
                                                                                                    width: Get.width * .36,
                                                                                                    child: CustomButton(
                                                                                                      height: 40.0,
                                                                                                      onPressed: () {
                                                                                                        Get.back();
                                                                                                        Get.to(
                                                                                                          () => const FundWalletView(),
                                                                                                          transition: Transition.downToUp,
                                                                                                        );
                                                                                                      },
                                                                                                      buttonText: 'Fund Wallet',
                                                                                                      buttonColor: Colors.white,
                                                                                                      buttonTextColor: const Color(0xffFE7A01),
                                                                                                      borderColor: const Color(0xffFE7A01),
                                                                                                      hasBorder: true,
                                                                                                    ),
                                                                                                  ),
                                                                                                  const SizedBox(
                                                                                                    height: 20,
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                } else {
                                                                                  controller.placeOrder(key);
                                                                                }
                                                                              },
                                                                              buttonText: 'Continue',
                                                                              buttonColor: const Color(0xFFFE7A01),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              4,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                },
                                                buttonText: 'Place Order',
                                              ),
                                            ),
                                          ),
                                        ],
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
                      ],
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  textInfo({call = "", res = ""}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      width: Get.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                call,
                style: const TextStyle(
                  color: Color(0XFF414249),
                  fontSize: 12,
                ),
              ),
              Text(
                res,
                style: const TextStyle(
                  color: Color(0XFF414249),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }

  Widget checkOutItem({
    message,
    image,
    color,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
            width: 68,
            child: Image.asset(
              image,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            message,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  deliveryTypeToggleBody() {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
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
      ),
    );
  }

  paymentTypeToggleBody() {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Row(
            children: [
              CustomCheckBox(
                value: controller.checkWallet.value,
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
                  controller.walletToggle();
                },
              ),
              const Text(
                'Wallet',
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
                value: controller.checkDebitCard.value,
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
                  controller.debitCardToggle();
                },
              ),
              const Text(
                'Debit Card',
                style: TextStyle(
                  color: Color(0XFF414249),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
