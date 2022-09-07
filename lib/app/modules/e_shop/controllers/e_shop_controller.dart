import 'dart:async';
import 'package:bot_toast/bot_toast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/services/e_shop_service.dart';
import 'package:jekawin_mobile_flutter/app/modules/jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';
import '../../../utils/helpers/text_helper.dart';
import '../models/e_shop_default_page_model.dart';
import '../models/my_cart_model.dart';
import '../models/search_product_model.dart';
import '../views/mobile/my_cart.dart';
import '../views/mobile/success_or_failure_mobile_view.dart';

class EShopController extends GetxController {
  EShopHomeModel? eShopHomeData;
  MyCartModel? myCartData;
  SearchProductModel? searchProductData;
  final EShopService service = Get.put(EShopService());
  final String phoneNumber = GetStorage().read("phoneNumber");
  final String homeAddress = GetStorage().read("homeAddress");
  final TextEditingController homeAddressText = TextEditingController(),
      phoneText = TextEditingController(),
      searchController = TextEditingController(text: "");
  var f = NumberFormat("#,##0.00", "en_US");
  String selectedDeliveryOption = 'delivery';
  String selectedPaymentType = 'wallet';
  Rx<bool> isSuccess = false.obs,
      checkDelivery = true.obs,
      checkPickUp = false.obs,
      checkWallet = true.obs,
      checkDebitCard = false.obs,
      isLoading = false.obs,
      searchHasData = false.obs;
  Rx<String> buttonText = 'Add to cart'.obs,
      quantity = "1".obs,
      updateType = ''.obs;
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

  void deliveryToggle() {
    if (checkPickUp.value == true) {
      checkDelivery.value = true;
      checkPickUp.value = false;
      selectedDeliveryOption = 'delivery';
    }
    update();
  }

  void pickUpToggle() {
    if (checkDelivery.value == true) {
      checkPickUp.value = true;
      checkDelivery.value = false;
      selectedDeliveryOption = 'pick up';
    }
    update();
  }

  void walletToggle() {
    if (checkDebitCard.value == true) {
      checkWallet.value = true;
      checkDebitCard.value = false;
      selectedDeliveryOption = 'wallet';
    }
    update();
  }

  void debitCardToggle() {
    if (checkWallet.value == true) {
      checkDebitCard.value = true;
      checkWallet.value = false;
      selectedDeliveryOption = 'debit card';
    }
    update();
  }

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

  Future<EShopHomeModel?> getEShopDefaultPageController() async {
    getMyCartItems();
    try {
      var res = await service.getEShopDefaultPage();
      if (res.statusCode == 200 || res.statusCode == 201) {
        eShopHomeData = EShopHomeModel.fromJson(res.data);
        return eShopHomeData;
      } else {}
    } catch (e) {}
    return null;
  }

  void addToCart({quantity, productId, currentSize}) async {
    isLoading.value = true;
    var body = {
      "quantity": quantity,
      "product": productId,
      "size": currentSize,
    };

    try {
      var res = await service.addToCartAPICall(body: body);
      if (res.statusCode == 200 || res.statusCode == 201) {
        isLoading.value = false;
        buttonText.value = 'View in cart';
        isSuccess.value = true;
      } else {
        BotToast.showText(text: res.data["message"]);
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
    }
  }

  Future<MyCartModel?> getMyCartItems() async {
    try {
      var res = await service.viewCartAPICall();
      if (res.statusCode == 200 || res.statusCode == 201) {
        myCartData = MyCartModel.fromJson(res.data);
        return myCartData;
      } else {}
    } catch (e) {}
    return null;
  }

  updateItemQuantityInCart({id}) async {
    if (updateType.value == 'Remove') {
      if (int.parse(quantity.value) > 1) {
        quantity.value = "${int.parse(quantity.value) - 1}";
        var body = {"quantity": int.parse(quantity.value)};
        try {
          var res =
              await service.updateItemQuantityInCartAPICall(body: body, id: id);
          if (res.statusCode == 200 || res.statusCode == 201) {
            Get.back();
            Get.to(() => MyCart(), transition: Transition.fadeIn);
          } else {
            BotToast.showText(text: res.data["message"]);
            isLoading.value = false;
          }
        } catch (e) {
          isLoading.value = false;
        }
      } else {
        await service.removeItemFromCartAPICall(id: id);
        Get.back();
        Get.to(() => MyCart(), transition: Transition.fadeIn);
      }
    }
    if (updateType.value == 'Add') {
      if (int.parse(quantity.value) < 10) {
        quantity.value = "${int.parse(quantity.value) + 1}";
        var body = {"quantity": int.parse(quantity.value)};
        try {
          var res =
              await service.updateItemQuantityInCartAPICall(body: body, id: id);
          if (res.statusCode == 200 || res.statusCode == 201) {
            Get.back();
            Get.to(() => MyCart(), transition: Transition.fadeIn);
          } else {
            BotToast.showText(text: res.data["message"]);
            isLoading.value = false;
          }
        } catch (e) {
          isLoading.value = false;
        }
      } else {
        BotToast.showText(text: 'Limit reached');
      }
    }
  }

  void placeOrder(Key? k, {prizeId}) async {
    isLoading.value = true;
    var body = {
      "deliveryType": selectedDeliveryOption,
      "phoneNumber": TextUtils()
          .stripFirstZeroAddCountryCode(number: phoneText.value.text)
          .toString(),
      "address": phoneText.text,
    };
    try {
      final updateRes = await service.checkOutAPICall(body: body);
      if (updateRes.statusCode == 200 || updateRes.statusCode == 201) {
        isLoading.value = false;
        Get.to(
          () => SuccessOrFailureMobileView(
            msg: 'Successful',
            success: true,
            className: JekawinBottomTabs(
              tabIndex: 3,
            ),
          ),
        );
      } else {
        BotToast.showSimpleNotification(
          title: updateRes.data['message'].toString(),
        );
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
    }
    isLoading.value = false;
    return null;
  }

  void addToWishList(Key? k, {productId}) async {
    var body = {
      "size": "M",
      "product": productId,
    };
    try {
      final updateRes = await service.addToWishListAPICall(body: body);
      if (updateRes.statusCode == 200 || updateRes.statusCode == 201) {
        BotToast.showText(
          text: updateRes.data['message'].toString(),
        );
      } else {
        BotToast.showText(
          text: updateRes.data['message'].toString(),
        );
      }
    } catch (e) {}
    isLoading.value = false;
    return null;
  }

  Future<SearchProductModel?> searchProduct(searchParam) async {
    try {
      var res = await service.searchProductAPICall(searchParam ?? "");
      if (res.statusCode == 200 || res.statusCode == 201) {
        print("This is search result: ${res.data}");
        searchProductData = SearchProductModel.fromJson(res.data);
        searchProductData!.data!.isEmpty
            ? searchHasData.value = false
            : searchHasData.value = true;
        print(searchHasData.value);
        return searchProductData;
      } else {}
    } catch (e) {}
    return null;
  }

  void updateColor(int index) {
    _updateColor1(index);
    _updateColor2(index);
    _updateColor3(index);
  }

  @override
  void onInit() {
    phoneText.text = phoneNumber;
    homeAddressText.text = homeAddress;
    super.onInit();
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
