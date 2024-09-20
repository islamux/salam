import 'package:elm/controller/base_controller.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_pre.dart';
import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ElmPreControllerImp extends BaseController {
  // final PageController pageControllerAssma = PageController();

  // double fontSize = 21.0;
  // int currentPageIndex = 0;
  // int currentPageCounter = 0;
  // List maxPageCounters = [];

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
}
