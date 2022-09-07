import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/controllers/e_shop_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/models/e_shop_default_page_model.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/views/mobile/e_shop_details_mobile_portrait.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/views/mobile/search_product.dart';
import '../widgets/category_circle_avatar.dart';
import './my_cart.dart';

class EShopMobilePortrait extends GetView<EShopController> {
  EShopMobilePortrait({Key? key}) : super(key: key);

  final EShopController eShopController = Get.put(EShopController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.4;
    final double itemWidth = size.width / 2;
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<EShopHomeModel?>(
        future: eShopController.getEShopDefaultPageController(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: SizedBox(
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 150.0,
                  ),
                  child: Text(
                    snapshot.error.toString(),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          } else if (snapshot.hasData) {
            EShopHomeModel? eShopHomeData = snapshot.data;
            return Stack(
              children: [
                ListView(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    const SizedBox(
                      height: 124.0,
                    ),
                    SizedBox(
                      height: 100,
                      width: Get.width,
                      child: ListView.builder(
                        // itemCount: upcomingMovies.length,
                        itemCount: eShopHomeData!.data!.categories!.length,
                        // controller: pageController2,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        scrollDirection: Axis.horizontal,
                        physics: const ScrollPhysics(),
                        // allowImplicitScrolling: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              for (int i = 0;
                                  i < eShopHomeData!.data!.categories!.length;
                                  i++)
                                InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    // Get.to(MovieDetail(
                                    //   data: upcomingMovies[index],
                                    // ));
                                  },
                                  child: categoryCircleAvatar(context,
                                      image: eShopHomeData!
                                          .data!.categories![i].imageUrl
                                          .split("s3")[0],
                                      category: eShopHomeData!
                                          .data!.categories![i].title),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 24.0,
                        right: 24.0,
                        top: 20.0,
                      ),
                      child: Text(
                        eShopHomeData!.data!.defaultCategoryTitle,
                        style: const TextStyle(
                          fontWeight: FontWeight.w200,
                          color: Color(0XFF212224),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    GridView.count(
                      childAspectRatio: (itemWidth / itemHeight),
                      controller: ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      semanticChildCount:
                          eShopHomeData!.data!.categories!.length,
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 2,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8.0,
                      ),
                      children: [
                        for (int i = 0;
                            i < eShopHomeData!.data!.products!.length;
                            i++)
                          newCollectionsCard(
                            context,
                            image: eShopHomeData!.data!.products![i].images![0],
                            itemAmount:
                                "₦ ${eShopHomeData!.data!.products![i].price.toString()}",
                            itemName: eShopHomeData!.data!.products![i].title,
                            onTap: () => Get.to(
                              () => EShopDetailsMobilePortrait(
                                productDetail:
                                    eShopHomeData!.data!.products![i],
                              ),
                              transition: Transition.cupertino,
                            ),
                            onHeartTap: () => eShopController.addToWishList(
                              key,
                              productId: eShopHomeData!.data!.products![i].id,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8.0,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xffFE7A01),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(42),
                      bottomRight: Radius.circular(42),
                    ),
                  ),
                  height: 108,
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 36.0,
                      right: 12.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          splashRadius: 24,
                          padding: EdgeInsets.zero,
                          icon: SvgPicture.asset(
                            'assets/svgs/bx_search-alt.svg',
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Get.to(
                              () => SearchProductMobilePortrait(),
                              transition: Transition.fadeIn,
                            );
                          },
                        ),
                        Row(
                          children: [
                            Container(
                              height: 26,
                              width: 26,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4)),
                              child: IconButton(
                                color: Colors.white,
                                splashRadius: 24,
                                padding: EdgeInsets.zero,
                                icon: SvgPicture.asset(
                                  'assets/svgs/heart_fill.svg',
                                  height: 15,
                                ),
                                onPressed: () {
                                  Get.to(() => MyCart(),
                                      transition: Transition.fadeIn);
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 26,
                              width: 26,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4)),
                              child: IconButton(
                                color: Colors.white,
                                splashRadius: 24,
                                padding: EdgeInsets.zero,
                                icon: SvgPicture.asset(
                                  'assets/svgs/clarity_shopping-cart-line.svg',
                                  color: const Color(0xffFE7A01),
                                  height: 18,
                                ),
                                onPressed: () {
                                  Get.to(() => MyCart(),
                                      transition: Transition.fadeIn);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return Stack(
            children: [
              ListView(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  const SizedBox(
                    height: 124.0,
                  ),
                  SizedBox(
                    height: 100,
                    width: Get.width,
                    child: ListView.builder(
                      // itemCount: upcomingMovies.length,
                      itemCount: 2,
                      // controller: pageController2,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      scrollDirection: Axis.horizontal,
                      physics: const ScrollPhysics(),
                      // allowImplicitScrolling: true,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {},
                          child: categoryCircleAvatar(
                            context,
                            image:
                                "https://jekawin/s3_image_upload_hoodie-grey.jpeg",
                            category: '',
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24.0,
                      right: 24.0,
                      top: 20.0,
                    ),
                    child: Container(
                      width: 200,
                      color: Colors.black.withOpacity(.04),
                      child: const Text(
                        'ukbliliob',
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          color: Colors.transparent,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  GridView.count(
                    childAspectRatio: (itemWidth / itemHeight),
                    controller: ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    semanticChildCount: 2,
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8.0,
                    ),
                    children: [
                      for (int i = 0; i < 2; i++)
                        defaultCollectionCard(
                          context,
                          image: '',
                          itemAmount: "",
                          itemName: "",
                          onTap: () => {},
                        ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 8.0,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xffFE7A01),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(42),
                    bottomRight: Radius.circular(42),
                  ),
                ),
                height: 108,
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 36.0,
                    right: 12.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        splashRadius: 24,
                        padding: EdgeInsets.zero,
                        icon: SvgPicture.asset(
                          'assets/svgs/bx_search-alt.svg',
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Get.to(() => SearchProductMobilePortrait(),
                              transition: Transition.fadeIn);
                        },
                      ),
                      Row(
                        children: [
                          Container(
                            height: 26,
                            width: 26,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4)),
                            child: IconButton(
                              color: Colors.white,
                              splashRadius: 24,
                              padding: EdgeInsets.zero,
                              icon: SvgPicture.asset(
                                'assets/svgs/heart_fill.svg',
                                height: 15,
                              ),
                              onPressed: () {
                                Get.to(() => MyCart(),
                                    transition: Transition.fadeIn);
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 26,
                            width: 26,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4)),
                            child: IconButton(
                              color: Colors.white,
                              splashRadius: 24,
                              padding: EdgeInsets.zero,
                              icon: SvgPicture.asset(
                                'assets/svgs/clarity_shopping-cart-line.svg',
                                color: const Color(0xffFE7A01),
                                height: 18,
                              ),
                              onPressed: () {
                                Get.to(() => MyCart(),
                                    transition: Transition.fadeIn);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  newCollectionsCard(
    context, {
    image,
    itemName,
    itemAmount,
    onTap,
    onHeartTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
          bottom: 12,
          top: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .232,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.black.withOpacity(.08),
                  ),
                  child: const Center(
                    child: SizedBox(
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .232,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white12,
                    image: DecorationImage(
                      image: NetworkImage(
                        image,
                      ),
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  itemAmount,
                  style: const TextStyle(
                    color: Color(0xffFE7A01),
                    fontSize: 14,
                  ),
                ),
                InkWell(
                  onTap: onHeartTap,
                  child: SvgPicture.asset(
                    'assets/svgs/Group.svg',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              itemName,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0XFF212224),
              ),
            ),
          ],
        ),
      ),
    );
  }

  defaultCollectionCard(
    context, {
    image,
    itemName,
    itemAmount,
    onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
          bottom: 12,
          top: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .232,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.black.withOpacity(.04),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.black.withOpacity(.04),
                  child: const Text(
                    'na;s fk;alskd',
                    style: TextStyle(
                      color: Colors.transparent,
                      fontSize: 14,
                    ),
                  ),
                ),
                SvgPicture.asset(
                  'assets/svgs/Group.svg',
                ),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            Container(
              color: Colors.black.withOpacity(.04),
              child: const Text(
                'uoyejkiuro',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
