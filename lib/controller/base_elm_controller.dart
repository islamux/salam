import 'package:elm/core/data/static/routes_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  final PageController pageController = PageController();

  // Shared properties (consider adding more based on your needs)
  double fontSize = 21.0;
  int currentPageIndex = 0;
  int currentPageCounter = 0;
  List<int> maxPageCounters = [];

  void goToHome() {
    Get.toNamed(AppRoute.home); // Assuming AppRoute is defined elsewhere
  }

  void increaseFontSize() {
    fontSize += 2.0;
    update();
  }

  void decreaseFontSize() {
    fontSize -= 2.0;
    update();
  }

  void resetCounter() {
    currentPageCounter = 0;
    update();
  }

  // Abstract methods to be implemented in subclasses
  void onPageChanged(int index);
  String getShareText(int index);
  void increamentPageController();
  void goToPage(int pageIndex);
}
