import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteFundingController extends GetxController{

  var pageLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(
        const Duration(seconds: 15),
            () {
         pageLoading.value=false;
          showDialog(
              context: Get.context!,
              builder: (BuildContext context) {
                return ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: Get.width),
                    child: const Center(child: CupertinoActivityIndicator(),));});});
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void dispose() {}

  @override
  void onClose() {}
}