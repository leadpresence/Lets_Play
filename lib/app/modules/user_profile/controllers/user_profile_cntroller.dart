import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/login/views/login.dart';
import '../../../config/services/auth_service.dart';

class UserProfileController extends GetxController {
  var extension;

  late File imageFile;
  String profilePictureUrl = '';
  String profilePictureName = '';
  String base64Image = '';
  Rx<String> imageLoading = "".obs;
  Rx<bool> isLoading = false.obs;
  Rx<String> imageName = ''.obs;
  final AuthServiceImpl authService = Get.find<AuthServiceImpl>();

  Future<void> signout(Key? k) async {
    // final userData = await authService.signout();
    // userData.fold(
    //   (l) {
    //     BotToast.showText(text: l.message);
    //   },
    //   (r) {
    navigateToLoginScreen(k);
    // },
    // );
  }

  navigateToLoginScreen(Key? k) {
    Get.to(
      () => const LoginView(),
      transition: Transition.cupertino,
    );
  }

  // Future<String> uploadFile(BuildContext context) async {
  //   final file = p.basename(imageFile.path);
  //   extension = p.extension(imageFile.path);
  //
  //   await S3BucketService.uploadImage(
  //       file: imageFile,
  //       awsFolderPath: "talent/users_profile",
  //       number: 1,
  //       context: context,
  //       extension: extension);
  //   update();
  //
  //   profilePictureUrl = 'loading';
  //   final urlDownload = await S3BucketService.getPresignedURLFromUnsigned(
  //       awsFolderPath: "talent/users_profile");
  //   profilePictureName = file;
  //   profilePictureUrl = urlDownload;
  //   print('Download-Link: $urlDownload');
  //   return urlDownload;
  // }
}
