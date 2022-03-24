import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/controllers/e_shop_controller.dart';

class EShopMobileLandscape extends GetView<EShopController> {
  const EShopMobileLandscape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.black12,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${controller.number.value}"),
              const SizedBox(
                height: 24,
              ),
              TextButton(
                onPressed: () => controller.increment(),
                child: const Text('Increment'),
              ),
              const SizedBox(
                height: 24,
              ),
              TextButton(
                onPressed: () => controller.decrement(),
                child: const Text('Decrement'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
