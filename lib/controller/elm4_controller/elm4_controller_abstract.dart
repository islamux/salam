import 'package:get/get.dart';

abstract class Elm4Controller extends GetxController {
  void goToHome(); // مؤقتا
  void increaseFontSize();
  void decreaseFontSize();
  void resetCounter();
  void onPageChanged(int index);
  String getShareText(int index);
  void increamentPageController();
  void goToPage(int pageIndex); // for slider()
}
