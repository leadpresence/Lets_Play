import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../services/base_service.dart';

class EShopService {
  BaseService service = BaseService();

  Future<Response> getAllCategoriesAPICall() async {
    try {
      Response response = await service.request('categories', method: 'Get');
      if (kDebugMode) {
        print(
            "This is the response status from the get All Categories API call: \n  ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> getEShopDefaultPage() async {
    try {
      Response response = await service.request('eshop', method: 'Get');
      if (kDebugMode) {
        print(
            "This is the response status from the getEShopDefaultPage API call: \n ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> addToCartAPICall({body}) async {
    try {
      Response response =
          await service.request('cart', body: body, method: 'Post');
      if (kDebugMode) {
        print(
            "This is the response status from the addToCart API call: \n ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> viewCartAPICall({body}) async {
    try {
      Response response = await service.request('cart', method: 'Get');
      if (kDebugMode) {
        print(
            "This is the response status from the viewCart API call: \n ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> updateItemQuantityInCartAPICall({body, id}) async {
    try {
      Response response =
          await service.request('cart/$id', body: body, method: 'Put');
      if (kDebugMode) {
        print(
            "This is the response status from the updateItemQuantityInCart API call: \n ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> removeItemFromCartAPICall({id}) async {
    try {
      Response response = await service.request('cart/$id', method: 'Delete');
      if (kDebugMode) {
        print(
            "This is the response status from the removeItemFromCart API call: \n ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> checkOutAPICall({body}) async {
    try {
      Response response =
          await service.request('orders', body: body, method: 'Post');
      if (kDebugMode) {
        print(
            "This is the response status from the checkOut API call: \n ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> addToWishListAPICall({body}) async {
    try {
      Response response =
          await service.request('wishlist', body: body, method: 'Post');
      if (kDebugMode) {
        print(
            "This is the response status from the addToWishList API call: \n ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> searchProductAPICall(searchParam) async {
    try {
      Response response = await service
          .request('products/search?q=$searchParam', method: 'Get');
      if (kDebugMode) {
        print(
            "This is the response status from the searchProduct API call: \n ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }
}
