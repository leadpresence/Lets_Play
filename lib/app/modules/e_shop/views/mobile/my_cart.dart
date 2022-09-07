import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/controllers/e_shop_controller.dart';
import '../../../../widgets/custom_large_button.dart';
import '../../../../widgets/fade_in_animations.dart';
import '../../../jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';
import '../../models/my_cart_model.dart';
import 'e_shop_make_payment.dart';

class MyCart extends StatelessWidget {
  final EShopController eShopController = Get.put(EShopController());
  MyCart({Key? key}) : super(key: key);

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
                      () => JekawinBottomTabs(
                        tabIndex: 3,
                      ),
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
                    "My Cart",
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
                                      "Snapshot has error: ${snapshot.hasError.toString()}",
                                    ),
                                  ),
                                );
                              } else if (snapshot.hasData) {
                                MyCartModel? data = snapshot.data!;
                                return data.body!.carts!.isEmpty
                                    ? Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 12.0),
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
                                                  child: Slidable(
                                                    key: const ValueKey(0),
                                                    endActionPane: ActionPane(
                                                      motion:
                                                          const ScrollMotion(),
                                                      dismissible:
                                                          DismissiblePane(
                                                        onDismissed: () {
                                                          eShopController
                                                              .removeFromCart(
                                                            data
                                                                .body!
                                                                .carts![
                                                                    position]
                                                                .id,
                                                          );
                                                        },
                                                      ),
                                                      children: [
                                                        SlidableAction(
                                                          onPressed: (val) {
                                                            eShopController
                                                                .removeFromCart(
                                                              data
                                                                  .body!
                                                                  .carts![
                                                                      position]
                                                                  .id,
                                                            );
                                                          },
                                                          backgroundColor:
                                                              Colors
                                                                  .red.shade600,
                                                          foregroundColor:
                                                              Colors.white,
                                                          icon: Icons.delete,
                                                          label: 'Delete',
                                                        ),
                                                      ],
                                                    ),
                                                    child: cartItem(
                                                      color: const Color(
                                                          0XFFFFF7EC),
                                                      message: data
                                                          .body!
                                                          .carts![position]
                                                          .title,
                                                      timeAgo: data
                                                          .body!
                                                          .carts![position]
                                                          .amount
                                                          .toString(),
                                                      image: data
                                                          .body!
                                                          .carts![position]
                                                          .image,
                                                      quantity: data
                                                          .body!
                                                          .carts![position]
                                                          .quantity
                                                          .toString(),
                                                      onTapRemove: () {
                                                        eShopController.quantity
                                                                .value =
                                                            data
                                                                .body!
                                                                .carts![
                                                                    position]
                                                                .quantity
                                                                .toString();
                                                        eShopController
                                                            .updateType
                                                            .value = 'Remove';
                                                        eShopController
                                                            .updateItemQuantityInCart(
                                                                id: data
                                                                    .body!
                                                                    .carts![
                                                                        position]
                                                                    .id);
                                                      },
                                                      onTapAdd: () {
                                                        eShopController.quantity
                                                                .value =
                                                            data
                                                                .body!
                                                                .carts![
                                                                    position]
                                                                .quantity
                                                                .toString();
                                                        eShopController
                                                            .updateType
                                                            .value = 'Add';
                                                        eShopController
                                                            .updateItemQuantityInCart(
                                                                id: data
                                                                    .body!
                                                                    .carts![
                                                                        position]
                                                                    .id);
                                                      },
                                                      onHeartPressed: () =>
                                                          eShopController
                                                              .addToWishList(
                                                        key,
                                                        productId: data
                                                            .body!
                                                            .carts![position]
                                                            .product,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          const SizedBox(height: 24),
                                          Container(
                                            height: 78,
                                            width: Get.width,
                                            decoration: const BoxDecoration(
                                              border: Border.symmetric(
                                                horizontal: BorderSide(
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
                                              left: 12.0,
                                              right: 12.0,
                                              bottom: 24.0,
                                              top: 60.0,
                                            ),
                                            child: Expanded(
                                              child: CustomButton(
                                                onPressed: () {
                                                  Get.to(
                                                    () =>
                                                        EShopMakePaymentMobileView(),
                                                    transition:
                                                        Transition.cupertino,
                                                  );
                                                },
                                                buttonText: 'Checkout',
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

  Widget cartItem({
    message,
    timeAgo,
    image,
    color,
    quantity,
    onTapRemove,
    onTapAdd,
    onHeartPressed,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                    width: 68,
                    child: Image.asset(
                      image,
                    ),
                  )
                ],
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    // width: Get.width * .65,
                    child: Text(
                      message,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        // height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "₦ $timeAgo",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFFFE7A01),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      InkWell(
                          onTap: onTapRemove,
                          child: SvgPicture.asset('assets/svgs/-.svg')),
                      const SizedBox(width: 8),
                      Text(quantity),
                      const SizedBox(width: 8),
                      InkWell(
                          onTap: onTapAdd,
                          child: SvgPicture.asset('assets/svgs/+.svg')),
                    ],
                  )
                ],
              ),
            ],
          ),
          IconButton(
            splashRadius: 24,
            icon: SvgPicture.asset(
              'assets/svgs/Group.svg',
              color: const Color(0xff12121D),
            ),
            onPressed: onHeartPressed,
          ),
        ],
      ),
    );
  }
}
