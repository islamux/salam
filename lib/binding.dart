import 'package:elm/controller/elm11_controller.dart';
import 'package:elm/controller/elm12_controller.dart';
import 'package:elm/controller/elm13_controller.dart';
import 'package:elm/controller/elm14_controller.dart';
import 'package:elm/controller/elm15_controller.dart';
import 'package:elm/controller/elm16_controller.dart';
import 'package:elm/controller/elm17_controller.dart';
import 'package:elm/controller/elm18_controller.dart';
import 'package:elm/controller/elm19_controller.dart';
import 'package:elm/controller/elm1_controller.dart';
import 'package:elm/controller/elm20_controller.dart';
import 'package:elm/controller/elm21_controller.dart';
import 'package:elm/controller/elm2_controller.dart';
import 'package:elm/controller/elm3_controller.dart';
import 'package:elm/controller/elm4_controller.dart';
import 'package:elm/controller/elm5_controller.dart';
import 'package:elm/controller/elm6_controller.dart';
import 'package:elm/controller/elm7_controller.dart';
import 'package:elm/controller/elm8_controller.dart';
import 'package:elm/controller/elm9_controller.dart';
import 'package:elm/controller/elmpre_controller.dart';
import 'package:elm/controller/floating_action_button_controller.dart';
import 'package:elm/controller/home_controller.dart';
import 'package:get/get.dart';

import 'controller/elm10_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    // i'd tray to add Font controller to binding but theres is some problem , it require Get.put()
    // binding Page controller
    Get.put(ElmPreControllerImp());
    Get.put(HomeControllerImp());
    Get.put(Elm1ControllerImp());
    Get.put(Elm2ControllerImp());
    Get.put(Elm3ControllerImp());
    Get.put(Elm4ControllerImp());
    Get.put(Elm5ControllerImp());
    Get.put(Elm6ControllerImp());
    Get.put(Elm7ControllerImp());
    Get.put(Elm8ControllerImp());
    Get.put(Elm9ControllerImp());
    Get.put(Elm10ControllerImp());
    Get.put(Elm11ControllerImp());
    Get.put(Elm12ControllerImp());
    Get.put(Elm13ControllerImp());
    Get.put(Elm14ControllerImp());
    Get.put(Elm15ControllerImp());
    Get.put(Elm16ControllerImp());
    Get.put(Elm17ControllerImp());
    Get.put(Elm18ControllerImp());
    Get.put(Elm19ControllerImp());
    Get.put(Elm20ControllerImp());
    Get.put(Elm21ControllerImp());
    Get.put(FloatingButtonControllerImp());
  }
}
