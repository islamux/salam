import 'package:elm/controller/base_controller.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_14.dart';

class Elm14ControllerImp extends BaseController {
  @override
  String getShareText(int index) {
    final elm = elmList14[index];

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
}
