import 'dart:convert';
import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jekawin_mobile_flutter/app/config/services/games_service.dart';
import 'package:jekawin_mobile_flutter/app/modules/edit_profile/views/mobile/edit_profile_mobile_porttrait.dart';
import 'package:jekawin_mobile_flutter/app/modules/user_profile/views/user_profile_view.dart';
import '../../../config/services/auth_service.dart';
import '../../../config/services/di/di_locator.dart';
import '../../../config/services/sw_bucket_service.dart';
import '../../../widgets/custom_large_button.dart';
import '../../../widgets/fade_in_animations.dart';
import '../../e_shop/views/mobile/success_or_failure_mobile_view.dart';
import '../models/update_profile_model.dart';
import '../views/mobile/email_otp_verification.dart';
import 'package:path/path.dart' as p;
import 'package:path/path.dart';

class EditProfileController extends GetxController {
  final AuthServiceImpl authService = Get.find<AuthServiceImpl>();
  final GamesServiceImpl gamesServiceImpl = Get.put(GamesServiceImpl());
  final editFormKey = GlobalKey<FormState>();
  var emailTextController = TextEditingController();
  final emailOTPCode = TextEditingController();
  final homeAddress = TextEditingController();

  final FocusNode searchTextField = FocusNode();
  final utilsProvider = UtilsController();

  var genders = [
    'Female',
    'Male',
  ];

  String dropDownValue = 'Male';

  RxString avatarUrl = "".obs;
  RxString emailErrorMessage = "".obs;
  Rx<bool> isLoading = false.obs;

  var extension;
  Rx<bool> isRawImageAssigned = false.obs;
  Rx<File> imageFile = File('').obs;
  String profilePictureUrl = '';
  String profilePictureName = '';
  String base64Image = '';
  Rx<String> imageLoading = "".obs;
  Rx<String> imageName = ''.obs;

  @override
  void onInit() {
    avatarUrl.value = GetStorage().read('profileImage');
    searchTextField.requestFocus();
    emailTextController.text = utilsProvider.getEmail();
    emailTextController = TextEditingController(text: utilsProvider.getEmail());
    super.onInit();
  }

  void clearErrorEmail() => emailErrorMessage.value = '';

  editProfileFormValidator(Key? k) {
    if ((GetUtils.isBlank(emailTextController.text)) == true) {
      return emailErrorMessage.value = 'Email Address field cannot be blank';
    } else if (!GetUtils.isEmail(emailTextController.text)) {
      return emailErrorMessage.value = 'Invalid Email Address';
    } else {
      upDateProfile(k);
    }
  }

  emailValidator(Key? k) {
    if ((GetUtils.isBlank(emailTextController.text)) == true) {
      return emailErrorMessage.value = 'Email Address field cannot be blank';
    } else if (!GetUtils.isEmail(emailTextController.text)) {
      return emailErrorMessage.value = 'Invalid Email Address';
    } else {
      showAddEmailAlertDialog(k);
    }
  }

  showAddEmailAlertDialog(Key? k) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return FadeIn(
          duration: const Duration(milliseconds: 200),
          delay: const Duration(milliseconds: 100),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: Get.width),
              child: Container(
                margin: EdgeInsets.zero,
                padding: const EdgeInsets.only(bottom: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 24.0,
                      offset: Offset(0.0, 10.0),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // To make the card compact
                  children: [
                    const SizedBox(height: 4.0),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                        top: 24.0,
                        bottom: 24.0,
                      ),
                      child: Text(
                        'Verify Your Email',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Please confirm that you want to use this email for your jekawin account',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff000000),
                              height: 1.6,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    Obx(
                      () => SizedBox(
                        width: Get.width * .36,
                        child: CustomButton(
                          height: 40.0,
                          onPressed: () {
                            addEmail(k);
                          },
                          buttonText: 'Verify',
                          isLoading: isLoading.value,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> upDateProfile(Key? k) async {
    isLoading.value = true;
    var data = profilePictureUrl == "" && homeAddress.text == ""
        ? {
            "gender": dropDownValue,
          }
        : homeAddress.text == ""
            ? {
                "profileUrl": profilePictureUrl,
                "gender": dropDownValue,
              }
            : profilePictureUrl == ""
                ? {
                    "gender": dropDownValue,
                    "residentialAddress": homeAddress.text,
                  }
                : {
                    "profileUrl": profilePictureUrl,
                    "residentialAddress": homeAddress.text,
                    "gender": dropDownValue,
                  };

    try {
      final updateRes = await gamesServiceImpl.updateProfile(data);
      UpdateProfileResponseModel res =
          UpdateProfileResponseModel.fromMap(updateRes.data);
      utilsProvider.setGender(res.body.data.gender);
      utilsProvider.setHomeAddress(res.body.data.residentialAddress);
      utilsProvider.setProfileUrl(res.body.data.profileUrl);
      if (updateRes.statusCode == 200 || updateRes.statusCode == 201) {
        GetStorage().write('homeAddress', homeAddress.text);
        GetStorage().write('gender', dropDownValue);
        Get.to(
          () => SuccessOrFailureMobileView(
            msg: 'Profile Updated Successfully',
            className: const UserProfileView(),
          ),
          transition: Transition.cupertino,
        );
        isLoading.value = false;
      } else {
        if (kDebugMode) {
          print(
              'Response.statusCode != 200: \n${UpdateProfileResponseModel.fromMap(updateRes.data).statusCode}');
          BotToast.showSimpleNotification(
            title:
                UpdateProfileResponseModel.fromMap(updateRes.data).toString(),
          );
        }
        isLoading.value = false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
        BotToast.showText(
          text: "An error occurred. Please try again. $e",
        );
      }
      isLoading.value = false;
    }
    // return body;
  }

  Future<void> addEmail(Key? k) async {
    isLoading.value = true;
    var emailAddressText = emailTextController.text;
    final emailData = await authService.addEmail(emailAddressText);

    emailData.fold(
      (l) {
        BotToast.showText(
          text: "An error occurred. Please try again.",
        );
        isLoading.value = false;
      },
      (r) {
        navigateToVerifyOTP(k);
        isLoading.value = false;
      },
    );
  }

  navigateToVerifyOTP(Key? k) {
    Get.back();
    utilsProvider.setEmail(emailTextController.text);
    emailTextController.text = utilsProvider.getEmail();
    Get.to(
      () => EmailOTPVerification(
        email: emailTextController.text,
      ),
      transition: Transition.cupertino,
    );
    isLoading.value = false;
  }

  Future<void> verifyEmailOTP(Key? k) async {
    isLoading.value = true;
    final userData = await authService.verifyEmailOtp(emailOTPCode.text);
    userData.fold(
      (l) {
        BotToast.showText(
          text: "An error occurred. Please try again.",
        );
        isLoading.value = false;
      },
      (r) {
        navigateToDashboard(k);
        isLoading.value = false;
      },
    );
  }

  navigateToDashboard(Key? k) {
    Get.to(
      () => SuccessOrFailureMobileView(
        msg: 'Email Successfully Added',
        className: EditProfileMobilePortrait(),
      ),
      transition: Transition.cupertino,
    );

    isLoading.value = false;
  }

  void pickImage(ImageSource source, BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(source: source);
    if (pickedFile != null) {
      imageLoading.value = 'image_loading';
      imageFile.value = File(pickedFile.path);

      GetStorage().write('rawImage', imageFile.value);

      isRawImageAssigned.value = true;
      List<int> imageBytes = imageFile.value.readAsBytesSync();
      base64Image = base64Encode(imageBytes);
      await uploadFile(context);
      refresh();
    }
  }

  // Future<String>

  uploadFile(BuildContext context) async {
    final file = basename(imageFile.value.path);
    extension = p.extension(imageFile.value.path);

    await S3BucketService.uploadImage(
      file: imageFile.value,
      awsFolderPath: "",
      number: 1,
      context: context,
      extension: extension,
    );

    profilePictureUrl = 'loading';

    final urlDownload = await S3BucketService.getPreSignedURLFromUnsigned(
      awsFolderPath: "",
    );

    profilePictureName = file;
    profilePictureUrl = urlDownload;

    GetStorage().write('profileImage', urlDownload);

    if (kDebugMode) {
      print('profilePictureName ==> $profilePictureName');
      print('Download-Link: $urlDownload');
    }
    return urlDownload;
  }
}
