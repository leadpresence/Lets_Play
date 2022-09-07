import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jekawin_mobile_flutter/app/modules/jekawin_club/models/get_club_members_response_model.dart';
import 'package:jekawin_mobile_flutter/app/modules/jekawin_club/services/club_services.dart';

import '../../../services/local_storage.dart';
import '../models/all_clubs_response_model.dart';
import '../views/mobile/jekawin_club_mobile_portrait.dart';
import '../views/mobile/widgets/home/jekawim_club_home.dart';

class ClubController extends GetxController {
  final ClubServices services = Get.put(ClubServices());

  late Rx<int> currentPage;
  Rx<int> totalRewardPoints = 0.obs, itemIndex = 0.obs;

  var isLoading = false.obs;

  AllClubsResponseModel? body;
  GetAllClubMembersResponseModel? membersBody;

  getAllClubs() async {
    isLoading.value = true;
    var walletBalance_ = GetStorage().read('walletBalance_');
    try {
      var response = await services.getAllClubs();
      LocalStorage.saveClubId('');
      if (response.statusCode == 200 || response.statusCode == 201) {
        body = AllClubsResponseModel.fromJson(response.data);
        for (int i = 0; i < body!.body.length; i++) {
          if (body!.body[i].minPoint < walletBalance_) {
            LocalStorage.saveClubId(body!.body[i].id);
            break;
          }
        }
        getClubMembers();
        return body;
      } else {
        if (kDebugMode) {
          if (AllClubsResponseModel.fromJson(response.data).body.isEmpty) {
            BotToast.showText(
              text: "NO CLUBS AVAILABLE",
            );
            Get.back();
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
     
      }
    }
    return body;
  }

  getClubMembers() async {
    var clubId_ = LocalStorage.getClubId();
    try {
      var response = await services.getClubMembers(clubId: clubId_);
      if (response.statusCode == 200 || response.statusCode == 201) {
        membersBody = GetAllClubMembersResponseModel.fromJson(response.data);
        Get.to(
          () => JekawinClubHome(
            membersBody: membersBody!,
          ),
          transition: Transition.cupertino,
        );
        // BotToast.showText(
        //   text: "CLUB ID : $clubId_",
        // );

        return membersBody;
      } else if (response.statusCode == 400) {
        Get.to(
          () => const JekawinClubMobilePortrait(),
          transition: Transition.cupertino,
        );
        BotToast.showText(
          text: "NO VALID CLUB ID",
        );
      } else {
        if (kDebugMode) {
          if (GetAllClubMembersResponseModel.fromJson(response.data)
              .data
              .members
              .isEmpty) {
            BotToast.showText(
              text: "NO MEMBERS",
            );
            Get.back();
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
     
      }
    }
    return body;
  }
}
