import 'package:elm/core/data/model/elm_lists/elm_list_pre.dart';
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
  goToHome() {
    Get.toNamed(AppRoute.home);
  }

  increaseFontSize() {
    fontSize += 2.0;
    update();
  }

  decreaseFontSize() {
    fontSize -= 2.0;
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

  String getShareText(int index) {
    final elm = elmListPre[index];
    StringBuffer shareText = StringBuffer();

    if (elm.title != null) {
      shareText.write('${elm.title!}\n\n');
    }

    if (elm.subtitle != null) {
      shareText.write('${elm.subtitle!}\n\n');
    }

    if (elm.text != null) {
      shareText.write('${elm.text!}\n\n');
    }

    if (elm.ayah != null) {
      shareText.write('${elm.ayah!}\n\n');
    }

    if (elm.footer != null) {
      shareText.write(elm.footer!);
    }

    return shareText.toString().trim();
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
        Get.snackbar(
          'الحمدلله',
          'أنهيب القراءة بنجاح',
          colorText: AppColor.black,
          backgroundColor: AppColor.transparent,
          duration: const Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }

    update();
  }

  void goToPage(int pageIndex) {
    pageControllerAssma.animateToPage(
      pageIndex,
      duration: const Duration(microseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
