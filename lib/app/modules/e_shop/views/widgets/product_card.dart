import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/controllers/e_shop_controller.dart';

class ProductCard extends GetView<EShopController> {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network('src'),

      ],
    );
  }
}
