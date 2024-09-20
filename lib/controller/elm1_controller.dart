import 'package:elm/controller/base_elm_controller.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_1.dart';
import 'package:elm/core/data/static/routes_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Elm1Controller extends BaseController {
  final PageController pageControllerAssma = PageController();

  @override
  String getShareText(int index) {
    final elm = elmList[index];
    StringBuffer shareText = StringBuffer();
    if (elm.title != null) shareText.write('${elm.title!}\n\n');
    if (elm.subtitle != null) shareText.write('${elm.subtitle!}\n\n');
    if (elm.text != null) shareText.write('${elm.text!}\n\n');
    if (elm.ayah != null) shareText.write('${elm.ayah!}\n\n');
    if (elm.footer != null) shareText.write(elm.footer!);
    return shareText.toString().trim();
  }

  @override
  void goToHome() {
    Get.toNamed(AppRoute.home);
  }

  @override
  void goToPage(int pageIndex) {
    // TODO: implement goToPage
  }

  @override
  void increamentPageController() {
    // TODO: implement increamentPageController
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }
}
