import 'package:elm/controller/elm5_controller.dart';
import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/function/custom_share_content.dart';
import 'package:elm/function/decrease_font.dart';
import 'package:elm/function/increase_font.dart';
import 'package:elm/view/widget/custom_text_slider/custom_text_slider_elm5.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Elm5 extends StatelessWidget {
  const Elm5({super.key});

  @override
  Widget build(BuildContext context) {
    //ElmPageControllerImp controllerM = Get.put(AthkarMassaControllerImp());
    final controllerM = Get.find<Elm5ControllerImp>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.black,
        foregroundColor: AppColor.amber,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              // share content by pass controlle as a parameter of current page
              onPressed: () => customShareContent(controllerM),
              icon: const Icon(Icons.share),
            ),
            const Text(
              " الخاطرة 5  ",
              // style: TextStyle(
              //     color: AppColor.primaryColorGolden,
              //     backgroundColor: AppColor.primaryColorBlack2),
            ),
          ],
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            //controllerM.resetCounter();
            Get.toNamed(AppRoute.home);
          },
          child: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // controllerM.decreaseFontSize();
              decreaseFont(controllerM);
            },
            icon: const Icon(Icons.remove),
          ),

          // Font between + -
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "الخط",
                //      style: TextStyle(color: AppColor.primaryColorGolden),
              ),
            ],
          ),

          IconButton(
              onPressed: () {
                // controllerM.increaseFontSize();
                increaseFont(controllerM);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: SafeArea(
        child: GestureDetector(
            onTap: () {
              // test adding sound when tap
              Feedback.forTap(context);
            },
            child: const CustomTextSliderElm5()),
      ),
    );
  }
}
