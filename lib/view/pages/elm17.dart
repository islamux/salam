import 'package:elm/controller/elm17_controller.dart';
import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/function/custom_share_content.dart';
import 'package:elm/function/decrease_font.dart';
import 'package:elm/function/increase_font.dart';
import 'package:elm/view/widget/custom_text_slider/sliders/custom_text_slider_elm17.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Elm17 extends StatelessWidget {
  const Elm17({super.key});

  @override
  Widget build(BuildContext context) {
    final Elm17ControllerImp controllerAs = Get.find<Elm17ControllerImp>();
    //Elm17ControllerImp controllerAs = Get.put(AthkarSabahControllerImp());
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
              "الخاطرة 17  ",
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
            Get.find<Elm17ControllerImp>().resetCounter();
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
          // Font between + -Elm17ControllerImp
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
              child: CustomTextSliderElm17(),
            ),
            // Slider to control the page

            // Scroll down indicator to tell user scroll down to reach to the end of txt
          ],
        ),
      ),
    );
  }
}
