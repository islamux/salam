import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  final PageController pageControllerAssma = PageController();

  double fontSize = 21.0;
  int currentPageIndex = 0;
  int currentPageCounter = 0;
  List maxPageCounters = [];

  void goToHome() {
    Get.toNamed(AppRoute.home);
  }

  void increaseFontSize() {
    if (fontSize <= 37.0) {
      fontSize += 2.0;
      update();
    }
  }

  void decreaseFontSize() {
    if (fontSize > 21.0) {
      fontSize -= 2.0;
      update();
    }
  }

  void resetCounter() {
    currentPageCounter = 0;
    update();
  }

  void onPageChanged(int index) {
    currentPageIndex = index;
    resetCounter();
  }

  void increamentPageController() {
    currentPageCounter++;

    if (currentPageCounter >= maxPageCounters[currentPageIndex]) {
      currentPageIndex++;

      if (currentPageIndex < maxPageCounters.length) {
        currentPageCounter = 0;

        pageControllerAssma.nextPage(
            duration: const Duration(microseconds: 500),
            curve: Curves.easeInOut);
      } else {
        showSnackBar();
      }
    }

    update();
  }

  void showSnackBar() {
    Get.snackbar(
      'الحمدلله',
      'أنهيب القراءة بنجاح',
      colorText: AppColor.black,
      backgroundColor: AppColor.transparent,
      duration: const Duration(seconds: 5),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void goToPage(int pageIndex) {
    pageControllerAssma.animateToPage(
      pageIndex,
      duration: const Duration(microseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void goToElmPre() {
    Get.toNamed(AppRoute.elmPre);
  }

  void goToElm1() {
    Get.toNamed(AppRoute.elm1);
  }

  void goToElm2() {
    Get.toNamed(AppRoute.elm2);
  }

  void goToElm3() {
    Get.toNamed(AppRoute.elm3);
  }

  void goToElm4() {
    Get.toNamed(AppRoute.elm4);
  }

  void goToElm5() {
    Get.toNamed(AppRoute.elm5);
  }

  void goToElm6() {
    Get.toNamed(AppRoute.elm6);
  }

  void goToElm7() {
    Get.toNamed(AppRoute.elm7);
  }

  void goToElm8() {
    Get.toNamed(AppRoute.elm8);
  }

  void goToElm9() {
    Get.toNamed(AppRoute.elm9);
  }

  void goToElm10() {
    Get.toNamed(AppRoute.elm10);
  }

  void goToElm11() {
    Get.toNamed(AppRoute.elm11);
  }

  void goToElm12() {
    Get.toNamed(AppRoute.elm12);
  }

  void goToElm13() {
    Get.toNamed(AppRoute.elm13);
  }

  void goToElm14() {
    Get.toNamed(AppRoute.elm14);
  }

  void goToElm15() {
    Get.toNamed(AppRoute.elm15);
  }

  void goToElm16() {
    Get.toNamed(AppRoute.elm16);
  }

  void goToElm17() {
    Get.toNamed(AppRoute.elm17);
  }

  void goToElm18() {
    Get.toNamed(AppRoute.elm18);
  }

  void goToElm19() {
    Get.toNamed(AppRoute.elm19);
  }

  void goToElm20() {
    Get.toNamed(AppRoute.elm20);
  }

  void goToElm21() {
    Get.toNamed(AppRoute.elm21);
  }

  void goToElm22() {
    Get.toNamed(AppRoute.elm22);
  }

  void goToElm23() {
    Get.toNamed(AppRoute.elm23);
  }
}
