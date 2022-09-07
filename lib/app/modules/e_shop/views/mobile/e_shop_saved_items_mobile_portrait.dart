import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../../widgets/custom_medium_button.dart';

class EShopSavedItemsMobileView extends StatelessWidget {
  const EShopSavedItemsMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
            child: Stack(children: [
              // List of savedItems
              //Todo felix implement a Future builder when api is integrated here

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
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange.withOpacity(.15),
                  ),
                  width: MediaQuery.of(context).size.width / 3.3,
                  height: MediaQuery.of(context).size.height / 8,
                  margin: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const Image(
                      fit: BoxFit.contain,
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
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    width: screenWidth(context) / 2,
                  ),
                  const Gap(10),
                  SizedBox(
                    child: Text(
                      "₦ " + price,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    width: screenWidth(context) / 2,
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
                            width: screenWidth(context) / 2,
                          ),
                        ),
                      ),
                      //buttons
                      //
                      CustomMediumButton(
                        onPressed: () {},
                        width: Get.width * .20,
                        fontSize: 12.0,
                        buttonText: 'Buy now',
                        buttonColor: Colors.orange,
                        buttonTextColor: Colors.white,
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
