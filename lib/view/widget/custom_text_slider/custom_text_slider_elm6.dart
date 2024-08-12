import 'package:elm/controller/elm6_controller.dart';
import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/imagelink/image_link.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/view/widget/custom_text_slider/pages_texts/6/get_page_four_texts.dart';
import 'package:elm/view/widget/custom_text_slider/pages_texts/6/get_page_one_texts.dart';
import 'package:elm/view/widget/custom_text_slider/pages_texts/6/get_page_three_texts.dart';
import 'package:elm/view/widget/custom_text_slider/pages_texts/6/get_page_two_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextSliderElm6 extends StatelessWidget {
  const CustomTextSliderElm6({super.key});

  @override
  Widget build(BuildContext context) {
    final Elm6ControllerImp controllerAs = Get.find<Elm6ControllerImp>();
    // to enable refresh ui (slider() moving)
    return GetBuilder<Elm6ControllerImp>(
      builder: (_) {
        return Stack(
          children: [
            // 1 in stack
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageLink.image12),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // 2 in stack
            SizedBox(
              // to fix auto size of hight of text
              height: MediaQuery.of(context).size.height,
              child: PageView.builder(
                reverse: true,
                // to enable move through pages slider() using pageController
                controller: controllerAs.pageControllerAssma,
                onPageChanged: (index) =>
                    // How to pass index. ==> onPageChanged(index)
                    controllerAs.onPageChanged(index),
                itemCount: elmList6.length,
                itemBuilder: (context, i) => Column(
                  children: [
                    // To make text scrollable make insid contatiner and the container inside Expanded
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 60, left: 32, right: 32, bottom: 60),
                        child: SingleChildScrollView(
                          child:
                              // To make font change when click on button wrab Text() with GetBuilder<Page1controllerImp>(build: (controller) return Text())
                              GetBuilder<Elm6ControllerImp>(
                            builder: (controllerAs) {
                              return RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        fontFamily: 'AmiriQ',
                                        fontSize: controllerAs.fontSize,
                                        color: Colors.black),
                                    children: [
                                      ...getPageOneTexts(i),
                                      ...getPageTowTexts(i),
                                      ...getPageThreeTexts(i),
                                      ...getPageFourTexts(i)
                                    ]),
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

            // slider widget
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
                      value: controllerAs.currentPageIndex.toDouble(),
                      onChanged: (double value) {
                        controllerAs.goToPage(value.toInt());
                      },
                      min: 0,
                      max: elmList6.length.toDouble() - 1,
                    ),
                  ),
                  // Display current page number
                  Text(
                    //'${controllerAs.currentPageCounter + 1} / ${elm1List.length}',
                    '${controllerAs.currentPageIndex + 1.toInt()} / ${elmList6.length}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
