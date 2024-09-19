import 'package:elm/controller/notification_controllr.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_pre.dart';
import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ElmPreController extends GetxController {
  void goToHome(); // مؤقتا
  void increaseFontSize();
  void decreaseFontSize();
  void resetCounter();
  void onPageChanged(int index);
  String getShareText(int index);
  void increamentPageController();
  void goToPage(int pageIndex); // for slider()
}

class ElmPreControllerImp extends ElmPreController {
  final PageController pageControllerAssma = PageController();
  final NotificationController notificationController =
      Get.find<NotificationController>(); // Find the NotificationController

  double fontSize = 21.0;
  int currentPageIndex = 0;
  int currentPageCounter = 0;
  List maxPageCounters = [];

  @override
  void onInit() {
    super.onInit();
    scheduleDailyNotification(); // Schedule the daily notification when this controller is initialized
  }

  // Schedule a daily notification at 6:00 AM
  void scheduleDailyNotification() {
    notificationController.scheduleDailyNotification(
      1, // Notification ID
      "Remember to Read",
      "Don't forget to read today's reflection!",
    );
  }

  @override
  goToHome() {
    Get.toNamed(AppRoute.home);
  }

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

  @override
  void resetCounter() {
    currentPageCounter = 0;
    update();
  }

  @override
  void onPageChanged(int index) {
    currentPageIndex = index;
    resetCounter();
  }

  @override
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

  @override
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
          '! أنهيت  قراءة أسماء الله الحسنى',
          colorText: AppColor.black,
          backgroundColor: AppColor.transparent,
          duration: const Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }

    update();
  }

  @override
  void goToPage(int pageIndex) {
    pageControllerAssma.animateToPage(
      pageIndex,
      duration: const Duration(microseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
