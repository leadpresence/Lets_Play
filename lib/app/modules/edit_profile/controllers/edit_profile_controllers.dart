import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class EditProfileController extends GetxController {

  final editFormKey = GlobalKey<FormState>();
  final firstnameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();

  RxString avatarUrl= "".obs;

  @override
  void onInit() {
    avatarUrl.value =GetStorage().read('profileImage');

    super.onInit();
  }
}