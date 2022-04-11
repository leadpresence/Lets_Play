import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:jekawin_mobile_flutter/app/config/data/local/user_local_interface.dart';
import 'package:jekawin_mobile_flutter/app/config/data/model/hive_boxes.dart';
import '../model/user.dart';

class UserLocalDataSourceImpl extends UserLocalDataSourceInterface {
  final Box userBox = Get.find<Box>(tag: HiveBox.USER_BOX);

  UserLocalDataSourceImpl();

  @override
  Future<void> cacheLoggedInUser(User userData) async {}

  @override
  void deleteUser(int userId) {
    userBox.deleteAt(userId);
  }

  @override
  User getUserById(int userId) {
    return userBox.getAt(userId);
  }

  @override
  Future<void> saveUser(User userData) async {
    userBox.put('user', userData);
  }

  @override
  Future<void> saveUserPassword(String password) async {}

  @override
  void clearUserBox() {
    userBox.clear();
    // getUser();
  }
}
