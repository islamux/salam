import 'package:elm/controller/elm21_controller.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_21.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_21_new.dart';
import 'package:elm/core/data/static/imagelink/image_link.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/view/widget/custom_text_slider/which_page_to_get/which_page_to_get_in_elm_21.dart';
import 'package:elm/view/widget/custom_text_slider/which_page_to_get/which_page_to_get_in_elm_21_new.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextSliderElm21 extends StatelessWidget {
  const CustomTextSliderElm21({super.key});

  @override
  Widget build(BuildContext context) {
    final Elm21ControllerImp controller = Get.find<Elm21ControllerImp>();

    return GetBuilder<Elm21ControllerImp>(
      builder: (_) {
        return Stack(
          children: [
            // Background image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageLink.image12),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // PageView
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: PageView.builder(
                reverse: true,
                controller: controller.pageControllerAssma,
                onPageChanged: (index) => controller.onPageChanged(index),
                itemCount: elmList21New.length,
                itemBuilder: (context, i) => Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 60, left: 32, right: 32, bottom: 60),
                        child: SingleChildScrollView(
                          child: GetBuilder<Elm21ControllerImp>(
                            builder: (controller) {
                              List<TextSpan> pageTexts = [];
                              pageTexts =
                                  whichPageToGetInElm21New(i, elmList21New);
                              return RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontFamily: "AmiriQ",
                                    fontSize: controller.fontSize,
                                    color: Colors.black,
                                  ),
                                  children: pageTexts,
                                ),
                                textAlign: TextAlign.right,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Slider widget
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Slider(
                      activeColor: AppColor.black,
                      inactiveColor: AppColor.grey,
                      value: controller.currentPageIndex.toDouble(),
                      onChanged: (double value) {
                        controller.goToPage(value.toInt());
                      },
                      min: 0,
                      max: elmList21New.length.toDouble() - 1,
                    ),
                  ),
                  Text(
                    '${controller.currentPageIndex + 1} / ${elmList21New.length}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
