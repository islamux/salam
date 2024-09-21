import 'package:get/get.dart';

class FontControllerImp extends GetxController {
// Proberties
  double fontSize = 21.0;

  increaseFontSize() {
    fontSize += 2.0;
    update();
  }

  decreaseFontSize() {
    fontSize -= 2.0;
    update();
  }
}
