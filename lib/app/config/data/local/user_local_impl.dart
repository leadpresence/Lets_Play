import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:jekawin_mobile_flutter/app/config/data/local/user_local_interface.dart';
import 'package:jekawin_mobile_flutter/app/config/data/model/hive_boxes.dart';
import '../model/user.dart';
import '../../../utils/type_id.dart';

class UserLocalDataSourceImpl extends UserLocalDataSourceInterface {
  User? _user = User();

  @override
  User? get user => _user;

  final HiveInterface _hiveService  = Get.find();

  bool get _isBoxOpen => _hiveService.isBoxOpen(HiveBox.USER_BOX);
  Box<User> get _userBox => _hiveService.box<User>(HiveBox.USER_BOX);

  UserLocalDataSourceImpl();

  @override
  Future<void> cacheLoggedInUser(User userData) async {}


  @override
  Future<void> init() async{
    if (!_isBoxOpen) {
      await _hiveService.openBox<User>(HiveBox.USER_BOX);
    }
  }
  @override
  void deleteUser(int userId) {
    _userBox.deleteAt(userId);
  }

  // @override
  // User getUserById(int userId) {
  //     _userBox.getAt(userId);
  // }

  @override
  Future<void> saveUser(User userData) async {
    _userBox.put('user', userData);
  }

  @override
  Future<void> saveUserPassword(String password) async {}

  @override
  void clearUserBox() {
    _userBox.clear();
    // getUser();
  }

  @override
  void getUser() {
    final defaultUser = User();

    // GetStorage().read('firstName', user?.firstName ?? '')
    _user = _userBox.get(TypeId.user);
  }
}
