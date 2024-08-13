import 'package:elm/controller/elm16_controller.dart';
import 'package:elm/core/data/model/page_content.dart';
import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/core/data/static/text/elm_text_ders_sixteen.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/function/custom_share_content.dart';
import 'package:elm/function/decrease_font.dart';
import 'package:elm/function/increase_font.dart';
import 'package:elm/view/widget/custom_text_slider/custom_text_slider_elm16.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Elm16 extends StatelessWidget {
  const Elm16({super.key});

  @override
  Widget build(BuildContext context) {
    final Elm16ControllerImp controllerAs = Get.find<Elm16ControllerImp>();
    //Elm16ControllerImp controllerAs = Get.put(AthkarSabahControllerImp());
    // Debug before rendering
    List<PageContent> pageContents = ElmTextDersSixteen.pageOne;
    debugPageContents(pageContents);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.black,
        foregroundColor: AppColor.amber,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              // share content by pass controlle as a parameter of current page
              onPressed: () => customShareContent(controllerAs),
              icon: const Icon(Icons.share),
            ),
            const Text(
              "الخاطرة 16  ",
              style: TextStyle(
                color: AppColor.primaryColorGolden,
                //backgroundColor: AppColor.primaryColorBlack2
              ),
            ),
          ],
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            // reset before return to home page
            Get.find<Elm16ControllerImp>().resetCounter();
            Get.toNamed(AppRoute.home);
          },
          child: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // controllerAs.decreaseFontSize();
              decreaseFont(controllerAs);
            },
            icon: const Icon(Icons.remove),
          ),
          // Font between + -
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // testing adding <Widget>
              Text(
                "الخط",
                // style: TextStyle(color: AppColor.primaryColorGolden),
              ),
            ],
          ),

          IconButton(
              onPressed: () {
                // controllerAs.increaseFontSize();
                increaseFont(controllerAs);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: const SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomTextSliderElm16(),
            ),
            // Slider to control the page

            // Scroll down indicator to tell user scroll down to reach to the end of txt
          ],
        ),
      ),
    );
  }
}

void debugPageContents(List<PageContent> pageContents) {
  for (int i = 0; i < pageContents.length; i++) {
    final content = pageContents[i];
    if (content.title == null || content.title!.isEmpty) {
      print('Page $i has an empty or null title');
    }
    if (content.subtitle == null || content.subtitle!.isEmpty) {
      print('Page $i has an empty or null subtitle');
    }
    if (content.text == null || content.text!.isEmpty) {
      print('Page $i has empty or null texts');
    }
    if (content.ayahHadith == null || content.ayahHadith!.isEmpty) {
      print('Page $i has empty or null Ayah or Hadith');
    }
  }
}
