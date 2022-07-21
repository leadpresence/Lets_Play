import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:jekawin_mobile_flutter/app/services/base_service.dart';

class ClubServices {
  final BaseService baseService = BaseService();

  Future<Response> getAllClubs() async {
    try {
      Response response =
          await baseService.request('jekawin-clubs', method: 'Get');
      if (kDebugMode) {
        print(
            "This is the response status from the getAllClubs API: \n ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> getClubMembers({clubId}) async {
    try {
      Response response = await baseService
          .request('jekawin-clubs/$clubId/members', method: 'Get');
      if (kDebugMode) {
        print(
            "This is the response status from the getClubMembers API: \n ${response.data}");
      }
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }
}
