import 'package:elm/controller/elm11_controller.dart';
import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/function/custom_share_content.dart';
import 'package:elm/function/decrease_font.dart';
import 'package:elm/function/increase_font.dart';
import 'package:elm/view/widget/custom_text_slider/sliders/custom_text_slider_elm11.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Elm11 extends StatelessWidget {
  const Elm11({super.key});

  @override
  Widget build(BuildContext context) {
    final Elm11ControllerImp controllerAs = Get.find<Elm11ControllerImp>();
    //Elm11ControllerImp controllerAs = Get.put(AthkarSabahControllerImp());
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
              " الخاطرة 11 ",
            ),
          ],
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            // reset before return to home page
            Get.find<Elm11ControllerImp>().resetCounter();
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
            children: [
              Text(
                "الخط",
                //    style: TextStyle(color: AppColor.primaryColorGolden),
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
              child: CustomTextSliderElm11(),
            ),
            // Slider to control the page

            // Scroll down indicator to tell user scroll down to reach to the end of txt
          ],
        ),
      ),
    );
  }
}
