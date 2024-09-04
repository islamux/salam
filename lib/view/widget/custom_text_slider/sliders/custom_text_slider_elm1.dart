import 'package:elm/controller/elm1_controller.dart';
import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_1.dart';
import 'package:elm/core/data/static/imagelink/image_link.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_eight_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_nineteen_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_eighteen_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_eleven_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_fifteen_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_five_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_four_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_fourteen_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_nine_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_one_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_seven_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_six_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_sixteen_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_seventeen_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_ten_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_therteen_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_three_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_twelve_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_twenty_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_two_texts.dart';

class CustomTextSliderElm1 extends StatelessWidget {
  const CustomTextSliderElm1({super.key});

  @override
  Widget build(BuildContext context) {
    final Elm1ControllerImp controller = Get.find<Elm1ControllerImp>();

    return GetBuilder<Elm1ControllerImp>(
      builder: (_) {
        return Stack(
          children: [
            // 1 in stack - Background Image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageLink.image12),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // 2 in stack - PageView
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: PageView.builder(
                reverse: true,
                controller: controller.pageControllerAssma,
                onPageChanged: (index) => controller.onPageChanged(index),
                itemCount: elmList.length,
                itemBuilder: (context, i) {
                  // Determine which page content to display
                  List<TextSpan> pageTexts;
                  switch (i) {
                    case 0:
                      pageTexts = getPageOneTexts(i);
                      break;
                    case 1:
                      pageTexts = getPageTwoTexts(i);
                      break;
                    case 2:
                      pageTexts = getPageThreeTexts(i);
                      break;
                    case 3:
                      pageTexts = getPageFourTexts(i);
                      break;
                    case 4:
                      pageTexts = getPageFiveTexts(i);
                      break;
                    case 5:
                      pageTexts = getPageSixTexts(i);
                      break;
                    case 6:
                      pageTexts = getPageSevenTexts(i);
                      break;
                    case 7:
                      pageTexts = getPageEightTexts(i);
                      break;
                    case 8:
                      pageTexts = getPageNineTexts(i);
                      break;
                    case 9:
                      pageTexts = getPageTenTexts(i);
                      break;
                    case 10:
                      pageTexts = getPageElevenTexts(i);
                      break;
                    case 11:
                      pageTexts = getPageTwelveTexts(i);
                      break;
                    case 12:
                      pageTexts = getPageTherteenTexts(i);
                      break;
                    case 13:
                      pageTexts = getPageFourteenTexts(i);
                      break;
                    case 14:
                      pageTexts = getPageFifteenTexts(i);
                      break;
                    case 15:
                      pageTexts = getPageSixteenTexts(i);
                      break;
                    case 16:
                      pageTexts = getPageSevnteenTexts(i);
                      break;
                    case 17:
                      pageTexts = getPageEighteenTexts(i);
                      break;
                    case 18:
                      pageTexts = getPageNineteenTexts(i);
                      break;
                    case 19:
                      pageTexts = getPageTwentyTexts(i);
                      break;
                    default:
                      pageTexts = [];
                  }

                  return Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 60, left: 32, right: 32, bottom: 60),
                          child: SingleChildScrollView(
                            child: GetBuilder<Elm1ControllerImp>(
                              builder: (controller) {
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
                  );
                },
              ),
            ),

            // 3 in stack - Slider Widget
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
                      max: elmList.length.toDouble() - 1,
                    ),
                  ),

                  // Display current page number
                  Text(
                    '${controller.currentPageIndex + 1} / ${elmList.length}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
