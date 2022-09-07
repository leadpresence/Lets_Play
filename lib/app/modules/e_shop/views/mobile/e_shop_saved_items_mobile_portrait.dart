import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/views/mobile/search_product.dart';
import '../../../../widgets/custom_large_button.dart';
import '../../../../widgets/custom_medium_button.dart';
import 'my_cart.dart';

class EShopSavedItemsMobileView extends StatelessWidget {
  const EShopSavedItemsMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView.builder(
              padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
              itemCount: 15,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return SingleSavedItems(key,
                    productname: "Beach Gown",
                    price: "20,000",
                    onRemove: () {},
                    image: null);
              }),
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
                  Text(
                    "Saved Items",
                    style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600, // light
                      fontStyle: FontStyle.normal,
                      color: Colors.white,
                      fontSize: 20, // italic
                    ),
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
                        Get.to(() => MyCart(), transition: Transition.fadeIn);
                      },
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

class SingleSavedItems extends StatelessWidget {
  final productname, price, image, onRemove;

  const SingleSavedItems(Key? key,
      {this.productname, this.price, this.image, this.onRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
        bottom: 12,
        top: 12,
      ),
      child: SizedBox(
        width: screenWidth(context) / 16, // * 0.08,
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  // padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.orange.withOpacity(.15),
                  ),
                  width: MediaQuery.of(context).size.width / 3.3,
                  height: MediaQuery.of(context).size.height / 8,
                  margin: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: const Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1559828707-3f2a972b6943?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      productname,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    width: screenWidth(context) / 2,
                  ),
                  const Gap(10),
                  SizedBox(
                    child: Text(
                      "₦ " + price,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFFFE7A01),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    width: screenWidth(context) / 2,
                  ),
                  const Gap(15),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomButton(
                        // isLoading: controller.isLoading.value,
                        height: 32.0,
                        onPressed: () {},
                        buttonText: 'Remove',
                        fontSize: 12,
                        buttonTextColor: Colors.red,
                        buttonColor: Colors.white,
                      ),
                      CustomButton(
                        // isLoading: controller.isLoading.value,
                        height: 32.0,
                        onPressed: () {},
                        buttonText: 'Buy now',
                        buttonColor: const Color(0xFFFE7A01),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
