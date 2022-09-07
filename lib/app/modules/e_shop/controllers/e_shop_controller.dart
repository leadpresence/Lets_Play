import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../config/services/e_shop_service.dart';
import '../models/WishListModel.dart';

class EShopController extends GetxController {

  final EshopServiceImpl eShopService = Get.find<EshopServiceImpl>();

  Rx<Color> color1 = const Color(0xFFDADEE3).obs,
      color2 = const Color(0xFFDADEE3).obs,
      color3 = const Color(0xFFDADEE3).obs;
  final _page1 = 0;
  final _page2 = 1;
  final _page3 = 2;

  Color activeColor = const Color(0xFFFE7A01);
  Color inactiveColor = const Color(0xFFDADEE3);

  PageController controller = PageController(
    initialPage: 0,
  );

  void _updateColor1(int index) {
    if (index == _page1) {
      color1.value = activeColor;
    } else {
      color1.value = inactiveColor;
    }
  }

  void _updateColor2(int index) {
    if (index == _page2) {
      color2.value = activeColor;
    } else {
      color2.value = inactiveColor;
    }
  }

  void _updateColor3(int index) {
    if (index == _page3) {
      color3.value = activeColor;
    } else {
      color3.value = inactiveColor;
    }
  }

  void updateColor(int index) {
    _updateColor1(index);
    _updateColor2(index);
    _updateColor3(index);
  }

  @override
  void onInit() {
    super.onInit();
    // _timer = Timer.periodic(
    //   const Duration(seconds: 5),
    //   (Timer timer) {
    //     if (_currentPage < 2) {
    //       _currentPage++;
    //     } else {
    //       _currentPage = 0;
    //     }
    //     controller.animateToPage(
    //       _currentPage,
    //       duration: const Duration(milliseconds: 500),
    //       curve: Curves.easeInOutQuart,
    //     );
    //   },
    // );
  }




  Future<List<WishList>> getProductWishList() async {
    List<WishList> wishList = await eShopService.getWishList();
    try {
      return wishList;
    } catch (e) {
      BotToast.showText(text: "Error occurred retrieving saved products");
    }
    return [];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
