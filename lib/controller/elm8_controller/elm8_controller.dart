import 'package:elm/controller/elm8_controller/elm8_controller_abstract.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_8.dart';
import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Elm8ControllerImp extends Elm8Controller {
  final PageController pageControllerAssma = PageController();
  // Proberties
  double fontSize = 21.0;
  int currentPageIndex = 0;
  int currentPageCounter = 0;
  List maxPageCounters = [];

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

  // method to handle page change
  @override
  void onPageChanged(int index) {
    currentPageIndex = index; // try to fix using casting
    // reset counter
    resetCounter();
  }

  @override
  String getShareText(int index) {
    final elm = elmList8[index];

    StringBuffer shareText = StringBuffer();

    // Check and add title
    if (elm.title != null) {
      shareText.write('${elm.title!}\n\n');
    }

    // Check and add subtitles
    if (elm.subtitle != null) {
      shareText.write('${elm.subtitle!}\n\n');
    }
    if (elm.subtitle2 != null) {
      shareText.write('${elm.subtitle2!}\n\n');
    }
    if (elm.subtitle3 != null) {
      shareText.write('${elm.subtitle3!}\n\n');
    }
    if (elm.subtitle4 != null) {
      shareText.write('${elm.subtitle4!}\n\n');
    }
    if (elm.subtitle5 != null) {
      shareText.write('${elm.subtitle5!}\n\n');
    }
    if (elm.subtitle6 != null) {
      shareText.write('${elm.subtitle6!}\n\n');
    }

    // Check and add text
    if (elm.text != null) {
      shareText.write('${elm.text!}\n\n');
    }
    if (elm.text2 != null) {
      shareText.write('${elm.text2!}\n\n');
    }
    if (elm.text3 != null) {
      shareText.write('${elm.text3!}\n\n');
    }
    if (elm.text4 != null) {
      shareText.write('${elm.text4!}\n\n');
    }
    if (elm.text5 != null) {
      shareText.write('${elm.text5!}\n\n');
    }
    if (elm.text6 != null) {
      shareText.write('${elm.text6!}\n\n');
    }
    if (elm.text7 != null) {
      shareText.write('${elm.text7!}\n\n');
    }
    if (elm.text8 != null) {
      shareText.write('${elm.text8!}\n\n');
    }

    // Check and add ayah
    if (elm.ayah != null) {
      shareText.write('${elm.ayah!}\n\n');
    }
    if (elm.ayah2 != null) {
      shareText.write('${elm.ayah2!}\n\n');
    }
    if (elm.ayah3 != null) {
      shareText.write('${elm.ayah3!}\n\n');
    }
    if (elm.ayah4 != null) {
      shareText.write('${elm.ayah4!}\n\n');
    }
    if (elm.ayah5 != null) {
      shareText.write('${elm.ayah5!}\n\n');
    }
    if (elm.ayah6 != null) {
      shareText.write('${elm.ayah6!}\n\n');
    }
    if (elm.ayah7 != null) {
      shareText.write('${elm.ayah7!}\n\n');
    }

    // Check and add footer
    if (elm.footer != null) {
      shareText.write(elm.footer!);
    }

    return shareText.toString().trim();
  }

  // @override
  // String getShareText(int index) {
  //   return elmList8[index].elmText ?? '';
  // }

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
