import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseElmController extends GetxController {
  final PageController pageController = PageController();
  double fontSize = 21.0;
  int currentPageIndex = 0;
  int currentPageCounter = 0;
  List<int> maxPageCounters = [];

  void goToHome();
  void increaseFontSize() {
    fontSize += 2.0;
    print("From Base Controller ");
    update();
  }

  void decreaseFontSize() {
    fontSize -= 2.0;
    print("From Base Controoler")
    update();
  }

  void resetCounter() {
    currentPageCounter = 0;
    update();
  }

  void onPageChanged(int index) {
    currentPageIndex = index;
    resetCounter();
  }

  String getShareText(int index);

  void increamentPageController() {
    currentPageCounter++;
    if (currentPageCounter >= maxPageCounters[currentPageIndex]) {
      currentPageIndex++;
      if (currentPageIndex < maxPageCounters.length) {
        currentPageCounter = 0;
        pageController.nextPage(
            duration: const Duration(microseconds: 500),
            curve: Curves.easeInOut);
      } else {
        Get.snackbar(
          'الحمدلله',
          '! أنهيت قراءة الصفحة',
          duration: const Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
    update();
  }

  void goToPage(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: const Duration(microseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
