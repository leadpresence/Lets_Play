import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventViewController extends GetxController {
  Rx<bool> saveASlot = false.obs;

  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
}