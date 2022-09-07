import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/controllers/e_shop_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/models/WishListModel.dart';
import '../../../../config/themes/app_theme_constants.dart';
import '../../../../widgets/custom_medium_button.dart';

class EShopSavedItemsMobileView extends StatelessWidget {
  EShopSavedItemsMobileView({Key? key, this.themeData, this.customAppTheme})
      : super(key: key);

  final ThemeData? themeData;
  final CustomAppTheme? customAppTheme;
  final EShopController controller = Get.put(EShopController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Stack(children: [
              FutureBuilder<List<WishList>>(
                  future: controller.getProductWishList(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      Center(
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
                      List<WishList>? wishlist = snapshot.data;
                      if (wishlist != null) {
                        if (wishlist.length > 1) {
                          return Expanded(
                            child: ListView.builder(
                                padding:
                                    const EdgeInsets.fromLTRB(18, 120, 18, 0),
                                itemCount: wishlist.length,
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int index) {
                                  return
                                    // Text("Postion item @${index}");

                                    SingleSavedItems(
                                    key,
                                    wishlist[index],
                                    onRemove: () {},
                                  );
                                }),
                          );
                        }
                        return Center(
                          child: SizedBox(
                            width: Get.width,
                            child: const Padding(
                              padding: EdgeInsets.only(
                                top: 150.0,
                              ),
                              child: Text(
                                "Your have not saved any item",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 24,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      }
                    }
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 32.0),
                        child: CupertinoActivityIndicator(
                          // strokeWidth: 1,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  }),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 8.0,
                ),
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(42),
                    bottomRight: Radius.circular(42),
                  ),
                ),
                height: 98,
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      splashRadius: 24,
                      padding: EdgeInsets.zero,
                      icon: SvgPicture.asset(
                        'assets/svgs/bx_search-alt.svg',
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    const Text(
                      "Saved Items",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                      splashRadius: 24,
                      padding: EdgeInsets.zero,
                      icon: SvgPicture.asset(
                        'assets/svgs/clarity_shopping-cart-line.svg',
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ])));
  }
}

class SingleSavedItems extends StatelessWidget {
  final onRemove;
  WishList wishes;

  SingleSavedItems(Key? key, this.wishes, {this.onRemove}) : super(key: key);

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
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange.withOpacity(.15),
                  ),
                  width: MediaQuery.of(context).size.width / 3.3,
                  height: MediaQuery.of(context).size.height / 8,
                  margin: EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      fit: BoxFit.contain,
                      image: NetworkImage(wishes.image),
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
                      wishes.title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    width: screenWidth(context) / 2,
                  ),
                  const Gap(10),
                  SizedBox(
                    child: Text(
                      "₦ " + wishes.amount.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    width: Get.width * 0.5,
                  ),
                  const Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: onRemove,
                          child: SizedBox(
                            child: const Text(
                              "Remove",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                            width: Get.width * 0.5,
                          ),
                        ),
                      ),
                  //     //buttons
                  //     //
                      Expanded(
                        child: CustomMediumButton(
                          onPressed: () {},
                          width: Get.width * .020,
                          fontSize: 12.0,
                          buttonText: 'Buy now',
                          itsBorderRadius: 15.0,
                          buttonColor: Colors.orange,
                          buttonTextColor: Colors.white,
                        ),
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
