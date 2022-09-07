import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/controllers/e_shop_controller.dart';
import '../../../../widgets/custom_search_text_field.dart';
import './my_cart.dart';
import 'e_shop_details_mobile_portrait.dart';

class SearchProductMobilePortrait extends GetView<EShopController> {
  SearchProductMobilePortrait({Key? key}) : super(key: key);

  final EShopController eShopController = Get.put(EShopController());

  @override
  Widget build(BuildContext context) {
    eShopController.searchHasData.value = false;
    eShopController.searchController.text = "";
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => Stack(
          children: [
            eShopController.searchHasData.value == false
                ? Padding(
                    padding: const EdgeInsets.only(top: 154),
                    child: SizedBox(
                      height: Get.height * .7,
                      width: Get.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                'No product found',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  height: 2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : SizedBox(
                    height: Get.height * .7,
                    child: ListView(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                      ),
                      children: [
                        const SizedBox(
                          height: 172.0,
                        ),
                        for (int i = 0;
                            i < eShopController.searchProductData!.data!.length;
                            i++)
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              eShopController.searchController.text =
                                  eShopController
                                      .searchProductData!.data![i].title;
                              Get.to(
                                SearchProductExplicitViewMobilePortrait(),
                                transition: Transition.fadeIn,
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                eShopController
                                    .searchProductData!.data![i].title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
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
              height: 150,
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 38.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      splashRadius: 24,
                      icon: SvgPicture.asset(
                        'assets/svgs/chevronLeft.svg',
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 12.0,
                        right: 12.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomSearchTextField(
                            prefixIcon: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: SvgPicture.asset(
                                'assets/svgs/bx_search-alt.svg',
                                color: Colors.black87,
                                height: 16,
                              ),
                            ),
                            hintText: 'Search',
                            onChanged: (val) {
                              eShopController.searchProduct(
                                  eShopController.searchController.text);
                            },
                            onFieldSubmitted: (String value) {
                              Get.off(
                                () => SearchProductExplicitViewMobilePortrait(),
                                transition: Transition.fadeIn,
                              );
                            },
                            textController: eShopController.searchController,
                            textCapitalization: TextCapitalization.none,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                          ),
                          const SizedBox(
                            width: 14,
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
                                height: 20,
                              ),
                              onPressed: () {
                                Get.to(() => MyCart(),
                                    transition: Transition.fadeIn);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchProductExplicitViewMobilePortrait extends GetView<EShopController> {
  SearchProductExplicitViewMobilePortrait({
    Key? key,
  }) : super(key: key);

  final EShopController eShopController = Get.put(EShopController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.4;
    final double itemWidth = size.width / 2;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
            height: Get.height * .7,
            child: ListView(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              children: [
                const SizedBox(
                  height: 124.0,
                ),
                GridView.count(
                  childAspectRatio: (itemWidth / itemHeight),
                  controller: ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  semanticChildCount:
                      eShopController.searchProductData!.data!.length,
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 2,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8.0,
                  ),
                  children: [
                    for (int i = 0;
                        i < eShopController.searchProductData!.data!.length;
                        i++)
                      newCollectionsCard(
                        context,
                        image: eShopController
                            .searchProductData!.data![i].images![0],
                        itemAmount:
                            "₦ ${eShopController.searchProductData!.data![i].price.toString()}",
                        itemName:
                            eShopController.searchProductData!.data![i].title,
                        onTap: () => Get.to(
                          () => EShopDetailsMobilePortrait(
                            productDetail:
                                eShopController.searchProductData!.data![i]!,
                          ),
                          transition: Transition.cupertino,
                        ),
                        onHeartTap: () => eShopController.addToWishList(
                          key,
                          productId:
                              eShopController.searchProductData!.data![i].id,
                        ),
                      ),
                  ],
                ),
              ],
            ),
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
            height: 150,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 38.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    splashRadius: 24,
                    icon: SvgPicture.asset(
                      'assets/svgs/chevronLeft.svg',
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 12.0,
                      right: 12.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomSearchTextField(
                          prefixIcon: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: SvgPicture.asset(
                              'assets/svgs/bx_search-alt.svg',
                              color: Colors.black87,
                              height: 16,
                            ),
                          ),
                          hintText: 'Search',
                          onChanged: (val) {
                            eShopController.searchProduct(
                                eShopController.searchController.text);
                          },
                          readOnly: true,
                          onFieldSubmitted: (String value) {
                            // homeController.generalSearch(
                            //   query: searchController.text,
                            //   searchText: searchController.text,
                            // );
                            // Get.off(
                            //       () => SearchExplicitView(
                            //     searchText: searchController.text,
                            //   ),
                            // );
                          },
                          textController: eShopController.searchController,
                          textCapitalization: TextCapitalization.none,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                        ),
                        const SizedBox(
                          width: 14,
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
                              height: 20,
                            ),
                            onPressed: () {
                              Get.to(() => MyCart(),
                                  transition: Transition.fadeIn);
                            },
                          ),
                        ),
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
