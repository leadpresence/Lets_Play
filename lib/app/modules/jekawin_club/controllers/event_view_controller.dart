import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventViewController extends GetxController {
  Rx<bool> saveASlot = false.obs;

  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  // final String formatted = formatter.format(now);
  // print(formatted); // something like 2013-04-20

  
}