import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/controllers/e_shop_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/views/mobile/e_shop_details_mobile_portrait.dart';

import '../widgets/category_circle_avatar.dart';

class EShopMobilePortrait extends GetView<EShopController> {
  const EShopMobilePortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.6;
    final double itemWidth = size.width / 2;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(
                height: 140.0,
              ),
              SizedBox(
                height: 100,
                width: Get.width,
                child: ListView.builder(
                  // itemCount: upcomingMovies.length,
                  itemCount: 4,
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
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            // Get.to(MovieDetail(
                            //   data: upcomingMovies[index],
                            // ));
                          },
                          child: categoryCircleAvatar(context,
                              image:
                                  'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/61/959583/2.jpg?6604',
                              category: 'Popular'),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            // Get.to(MovieDetail(
                            //   data: upcomingMovies[index],
                            // ));
                          },
                          child: categoryCircleAvatar(context,
                              image:
                                  'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/30/169556/1.jpg?6684',
                              category: 'Popular'),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            // Get.to(MovieDetail(
                            //   data: upcomingMovies[index],
                            // ));
                          },
                          child: categoryCircleAvatar(context,
                              image:
                                  'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/34/682796/1.jpg?1168',
                              category: 'Popular'),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            // Get.to(MovieDetail(
                            //   data: upcomingMovies[index],
                            // ));
                          },
                          child: categoryCircleAvatar(context,
                              image:
                                  'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/96/161326/1.jpg?6433',
                              category: 'Popular'),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  top: 20.0,
                ),
                child: Text(
                  'New collections',
                  style: TextStyle(
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
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 8.0,
                ),
                children: [
                  // snapshot.data!.map(
                  //   (savedMovie) {
                  //     return
                  newCollectionsCard(
                    context,
                    image:
                        'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/43/320107/1.jpg?3064',
                    itemAmount: '₦ 50.99',
                    itemName: 'Short Black',
                  ),
                  newCollectionsCard(
                    context,
                    image:
                        'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/40/268383/1.jpg?6317',
                    itemAmount: '₦ 250.99',
                    itemName: 'Wine Evening Gown',
                  ),
                  newCollectionsCard(
                    context,
                    image:
                        'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/12/523583/1.jpg?4633',
                    itemAmount: '₦ 43.99',
                    itemName: 'Short White',
                  ),
                  newCollectionsCard(
                    context,
                    image:
                        'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/82/528996/1.jpg?7513',
                    itemAmount: '₦ 250.99',
                    itemName: 'Long Evening Gown',
                  ),
                  newCollectionsCard(
                    context,
                    image:
                        'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/38/790838/1.jpg?2626',
                    itemAmount: '₦ 73.91',
                    itemName: 'Jelly Slick black',
                  ),
                  newCollectionsCard(
                    context,
                    image:
                        'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/37/268383/1.jpg?9312',
                    itemAmount: '₦ 134.99',
                    itemName: 'Wedding Evening Gown',
                  ),
                  newCollectionsCard(
                    context,
                    image:
                        'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/93/3927501/1.jpg?7126',
                    itemAmount: '₦ 25.99',
                    itemName: 'Long Evening Gown',
                  ),
                  newCollectionsCard(
                    context,
                    image:
                        'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/70/444056/1.jpg?1654',
                    itemAmount: '₦ 85.99',
                    itemName: 'Sandy Still Blue',
                  ),
                  newCollectionsCard(
                    context,
                    image:
                        'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/88/531276/1.jpg?7571',
                    itemAmount: '₦ 25.99',
                    itemName: 'Short Evening Gown',
                  ),
                ],
                //   },
                // ).toList(),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 28.0,
            ),
            decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(52),
                bottomRight: Radius.circular(52),
              ),
            ),
            height: 108,
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  'assets/svgs/bx_search-alt.svg',
                  color: Colors.white,
                ),
                SvgPicture.asset(
                  'assets/svgs/clarity_shopping-cart-line.svg',
                  color: Colors.white,
                ),
              ],
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
  }) {
    return GestureDetector(
      onTap: () => Get.to(
        () => EShopDetailsMobilePortrait(
          image: image,
          itemName: itemName,
          itemAmount: itemAmount,
        ),
        transition: Transition.cupertino,
      ),
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
              // child: Image.asset(image),
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
                SvgPicture.asset(
                  'assets/svgs/Group.svg',
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
}
