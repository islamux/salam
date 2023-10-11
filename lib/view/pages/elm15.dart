import 'package:elm/controller/elm15_controller.dart';
import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/function/custom_share_content.dart';
import 'package:elm/view/widget/custom_text_slider/custom_text_slider_elm15.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Elm15 extends StatelessWidget {
  const Elm15({super.key});

  @override
  Widget build(BuildContext context) {
    final Elm15ControllerImp controllerAs =
        Get.find<Elm15ControllerImp>();
    //Elm15ControllerImp controllerAs = Get.put(AthkarSabahControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              // share content by pass controlle as a parameter of current page
              onPressed: () => customShareContent(controllerAs),
              icon: const Icon(Icons.share),
            ),
            const Text(
              "الخاطرة 15  ",
              style: TextStyle(
                  color: AppColor.primaryColorGolden,
                  backgroundColor: AppColor.primaryColorBlack2),
            ),
          ],
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            // reset before return to home page
            Get.find<Elm15ControllerImp>().resetCounter();
            Get.toNamed(AppRoute.home);
          },
          child: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              controllerAs.decreaseFontSize();
            },
            icon: const Icon(Icons.remove),
          ),
          // Font between + -
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "الخط",
                style: TextStyle(color: AppColor.primaryColorGolden),
              ),
            ],
          ),

          IconButton(
              onPressed: () {
                controllerAs.increaseFontSize();
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: const SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomTextSliderElm15(),
            ),
            // Slider to control the page

            // Scroll down indicator to tell user scroll down to reach to the end of txt
          ],
        ),
      ),
    );
  }
}
