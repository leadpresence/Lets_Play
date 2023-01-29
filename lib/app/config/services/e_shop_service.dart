import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/models/WishListModel.dart';

import '../../services/base_service.dart';
import '../data/local/user_local_impl.dart';
import 'di/di_locator.dart';
import 'http/base_urls.dart';
import 'http/http_services.dart';

abstract class EshopService {
  Future<List<WishList>> getWishList();
}

class EshopServiceImpl extends EshopService {

  final httpProvider = Get.find<HttpService>();
  final utilsProvider = Get.find<UtilsController>();
  BaseService service = BaseService();

  @override
  Future<List<WishList>> getWishList() async {
    var raw = await httpProvider.getHttp(
        '${JekawinBaseUrls.authBaseUrl}wishlist');
    WishlistResponse response = WishlistResponse.fromMap(raw);
    var responseList = response.body;
    return responseList;
  }


}