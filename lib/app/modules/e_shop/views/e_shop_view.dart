import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/views/mobile/e_shop_mobile_landscape.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../controllers/e_shop_controller.dart';
import 'mobile/e_shop_mobile_portrait.dart';

/// this widget holds all the different screen sizes and it's responsible
/// for splitting the views to their appropriate size.
/// please take a look at the [responsive_builder] package for more
/// understanding.

class EShopView extends GetView<EShopController> {
  const EShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => OrientationLayoutBuilder(
        portrait: (_) => const EShopMobilePortrait(),
        landscape: (_) =>
            const EShopMobilePortrait(), // replace with landscape view for mobile
      ),
      tablet: (_) => OrientationLayoutBuilder(
        portrait: (_) =>
            const EShopMobilePortrait(), // replace with portrait view for tablet
        landscape: (_) =>
            const EShopMobilePortrait(), // replace with landscape view for tablet
      ),
    );
  }
}
