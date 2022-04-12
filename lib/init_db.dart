import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:jekawin_mobile_flutter/app/config/data/local/user_local_interface.dart';
import 'package:jekawin_mobile_flutter/app/config/data/local/user_local_impl.dart';
import 'package:jekawin_mobile_flutter/app/config/data/model/hive_boxes.dart';
import 'package:jekawin_mobile_flutter/app/config/data/model/user.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

// init qlobalize the local db for application
// this is necessary to allow global initialization of the db
// and opening of tables

Future<void> initHiveDb() async {
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive
    ..init(appDocumentDir.path)
    ..registerAdapter(UserAdapter());

// add any other adapters here e.g games adapter
// open boxes
  final Box userBox   = await Hive.openBox(HiveBox.USER_BOX);
  final Box boolsBox = await Hive.openBox(HiveBox.BOOLS_BOX);
  final Box stringBox = await Hive.openBox(HiveBox.STRING_BOX);
  final Box shopBox = await Hive.openBox(HiveBox.SHOP_BOX);
  final Box gamesBox = await Hive.openBox(HiveBox.GAMES_BOX);

  //inject globally
  Get.put<Box>(userBox, tag: HiveBox.USER_BOX);
  //...inject other boxes
  //...
  //...
}
