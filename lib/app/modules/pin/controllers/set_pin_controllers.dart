import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SetPinController extends GetxController
with SingleGetTickerProviderMixin {

final pinController = TextEditingController();
final confirmPinController = TextEditingController();
late Rx<AnimationController> animationController =
    AnimationController(vsync: this).obs;

var pin = "".obs;
var confirmPin = "".obs;

}