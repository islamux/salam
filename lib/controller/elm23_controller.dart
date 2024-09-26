import 'package:elm/controller/base_controller.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_23.dart';

class Elm23ControllerImp extends BaseController {
  // final PageController pageControllerAssma = PageController();

  // double fontSize = 21.0;
  // int currentPageIndex = 0;
  // int currentPageCounter = 0;
  // List maxPageCounters = [];

  @override
  String getShareText(int index) {
    final elm = elmList23[index];
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
