import 'package:elm/controller/elm20_controller.dart';
import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/function/custom_share_content.dart';
import 'package:elm/function/decrease_font.dart';
import 'package:elm/function/increase_font.dart';
import 'package:elm/view/widget/custom_text_slider/sliders/custom_text_slider_elm20.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Elm20 extends StatelessWidget {
  const Elm20({super.key});

  @override
  Widget build(BuildContext context) {
    final Elm20ControllerImp controller = Get.find<Elm20ControllerImp>();
    //Elm20ControllerImp controller = Get.put(AthkarSabahControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.black,
        foregroundColor: AppColor.amber,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              // share content by pass controlle as a parameter of current page
              onPressed: () => customShareContent(controller),
              icon: const Icon(Icons.share),
            ),
            const Text(
              "الخاطرة 20  ",
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
            Get.find<Elm20ControllerImp>().resetCounter();
            Get.toNamed(AppRoute.home);
          },
          child: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.decreaseFontSize();
              //decreaseFont(controller);
            },
            icon: const Icon(Icons.remove),
          ),
          // Font between + -Elm20ControllerImp
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
                controller.increaseFontSize();
                // increaseFont(controller);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: const SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomTextSliderElm20(),
            ),
            // Slider to control the page

            // Scroll down indicator to tell user scroll down to reach to the end of txt
          ],
        ),
      ),
    );
  }
}
