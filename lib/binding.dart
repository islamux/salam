import 'package:elm/controller/elm3_controller.dart';
import 'package:elm/controller/floating_action_button_controller.dart';
import 'package:elm/controller/home_controller.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    // i'd tray to add Font controller to binding but theres is some problem , it require Get.put()
    // binding Page controller
    Get.put(HomeControllerImp());
    Get.put(Elm3ControllerImp());
    Get.put(FloatingButtonControllerImp());
  }
}
