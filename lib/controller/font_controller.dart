import 'package:get/get.dart';

abstract class FontController extends GetxController {
  void increaseFontSize();
  void decreaseFontSize();
}

class FontControllerImp extends FontController {
  // Proberties
  double fontSize = 21.0;

  @override
  increaseFontSize() {
    fontSize += 2.0;
    update();
  }

  @override
  decreaseFontSize() {
    fontSize -= 2.0;
    update();
  }
}
