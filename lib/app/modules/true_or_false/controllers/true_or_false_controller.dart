import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/true_or_false/models/true_or_false_game_response_model.dart';

class TrueOrFalseController extends GetxController
    with GetTickerProviderStateMixin {
  late Rx<int> currentPage;
  late AnimationController nextController;
  late PageController bgPageController;
  List<Item> items = [
    Item(
      title: 'M',
      price: 5500,
      imageUrl: 'https://startupslang.s3.amazonaws.com/item-3.jpeg',
      id: 1,
    ),
    Item(
      title: 'M',
      price: 5000,
      imageUrl: 'https://startupslang.s3.amazonaws.com/item-4.jpeg',
      id: 2,
    ),
    Item(
      title: 'M',
      price: 7000,
      imageUrl: 'https://startupslang.s3.amazonaws.com/item-6.jpeg',
      id: 3,
    ),
    Item(
      title: 'M',
      price: 7800,
      imageUrl: 'https://startupslang.s3.amazonaws.com/item-7.jpeg',
      id: 4,
    ),
    Item(
      title: 'M',
      price: 5500,
      imageUrl: 'https://startupslang.s3.amazonaws.com/item-8.jpeg',
      id: 5,
    ),
  ];

  void nextPage() async {
    moveToNextPage(lastPage: items.length - 1);
    await animateMovingToNextPage();
    slideBackgroundTo(currentPage.value);
  }

  void slideBackgroundTo(int currentPage) {
    bgPageController.animateToPage(
      currentPage,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 470),
    );
  }

  void moveToNextPage({required int lastPage}) async {
    if (currentPage.value == lastPage) {
      // await Future.delayed(Duration(milliseconds: 150));
      // Get.offNamed(Routes.WELCOME);
    } else {
      currentPage.value++;
    }
  }

  Future<void> animateMovingToNextPage() async {
    nextController.reverse(from: nextController.upperBound);
    await Future.delayed(const Duration(milliseconds: 200));
    nextController.forward(from: nextController.lowerBound);
  }

  @override
  void onInit() {
    currentPage = 0.obs;
    nextController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
      reverseDuration: const Duration(milliseconds: 400),
    );
    bgPageController = PageController();
    super.onInit();
  }

  @override
  void dispose() {
    nextController.dispose();
    bgPageController.dispose();
    super.dispose();
  }
}
