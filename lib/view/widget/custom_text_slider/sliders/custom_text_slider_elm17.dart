import 'package:elm/controller/elm17_controller.dart';
import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_17.dart';
import 'package:elm/core/data/static/imagelink/image_link.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/17/get_page_five_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/17/get_page_four_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/17/get_page_one_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/17/get_page_seven_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/17/get_page_six_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/17/get_page_three_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/17/get_page_two_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/17/get_page_ten_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/17/get_page_eight_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/17/get_page_nine_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/17/get_page_eleven_texts.dart';

class CustomTextSliderElm17 extends StatelessWidget {
  const CustomTextSliderElm17({super.key});

  @override
  Widget build(BuildContext context) {
    final Elm17ControllerImp controller = Get.find<Elm17ControllerImp>();

    return GetBuilder<Elm17ControllerImp>(
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
                itemCount: elmList17.length,
                itemBuilder: (context, i) => Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 60, left: 32, right: 32, bottom: 60),
                        child: SingleChildScrollView(
                          child: GetBuilder<Elm17ControllerImp>(
                            builder: (controller) {
                              List<TextSpan> textSpans = [];
                              switch (i) {
                                case 0:
                                  textSpans.addAll(getPageOneTexts(i));
                                  break;
                                case 1:
                                  textSpans.addAll(getPageTwoTexts(i));
                                  break;
                                case 2:
                                  textSpans.addAll(getPageThreeTexts(i));
                                  break;
                                case 3:
                                  textSpans.addAll(getPageFourTexts(i));
                                  break;
                                case 4:
                                  textSpans.addAll(getPageFiveTexts(i));
                                  break;
                                case 5:
                                  textSpans.addAll(getPageSixTexts(i));
                                  break;
                                case 6:
                                  textSpans.addAll(getPageSevenTexts(i));
                                  break;
                                case 7:
                                  textSpans.addAll(getPageEightTexts(i));
                                  break;
                                case 8:
                                  textSpans.addAll(getPageNineTexts(i));
                                  break;
                                case 9:
                                  textSpans.addAll(getPageTenTexts(i));
                                  break;
                                case 10:
                                  textSpans.addAll(getPageElevenTexts(i));
                                  break;
                                // Add more cases if needed
                                default:
                                  textSpans.add(TextSpan(text: ''));
                              }

                              return RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontFamily: "AmiriQ",
                                    fontSize: controller.fontSize,
                                    color: Colors.black,
                                  ),
                                  children: textSpans,
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
                      max: elmList17.length.toDouble() - 1,
                    ),
                  ),
                  Text(
                    '${controller.currentPageIndex + 1} / ${elmList17.length}',
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


// class CustomTextSliderElm17 extends StatelessWidget {
//   const CustomTextSliderElm17({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final Elm17ControllerImp controller = Get.find<Elm17ControllerImp>();
//     // to enable refresh ui (slider() moving)
//     return GetBuilder<Elm17ControllerImp>(
//       builder: (_) {
//         return Stack(
//           children: [
//             // 1 in stack
//             Container(
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(ImageLink.image12),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             // 2 in stack
//             SizedBox(
//               // to fix auto size of hight of text
//               height: MediaQuery.of(context).size.height,
//               child: PageView.builder(
//                 reverse: true,
//                 // to enable move through pages slider() using pageController
//                 controller: controller.pageControllerAssma,
//                 onPageChanged: (index) =>
//                     // How to pass index. ==> onPageChanged(index)
//                     controller.onPageChanged(index),
//                 itemCount: elmList17.length,
//                 itemBuilder: (context, i) => Column(
//                   children: [
//                     // To make text scrollable make insid contatiner and the container inside Expanded
//                     Expanded(
//                       child: Container(
//                         padding: const EdgeInsets.only(
//                             top: 60, left: 32, right: 32, bottom: 60),
//                         child: SingleChildScrollView(
//                           child:
//                               // To make font change when click on button wrab Text() with GetBuilder<Page1controllerImp>(build: (controller) return Text())
//                               GetBuilder<Elm17ControllerImp>(
//                             builder: (controller) {
//                               return
//                                   // Rich Text Loop on rich text
//                                   RichText(
//                                 text: TextSpan(
//                                   style: TextStyle(
//                                     fontFamily: "AmiriQ",
//                                     fontSize: controller.fontSize,
//                                     color: Colors.black,
//                                   ),
//                                   children: [
//                                     //  page 1 , page 2 , page 3
//                                     ...getPageOneTexts(i),
//                                     ...getPageTwoTexts(i),
//                                     ...getPageThreeTexts(i),
//                                     ...getPageFourTexts(i),
//                                     ...getPageFiveTexts(i),
//                                     ...getPageSixTexts(i),
//                                     ...getPageSevenTexts(i),
//                                     ...getPageEightTexts(i),
//                                     ...getPageNineTexts(i),
//                                     ...getPageTenTexts(i),
//                                     ...getPageElevenTexts(i),
//                                   ],
//                                 ),
//                                 textAlign: TextAlign.right,
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             // slider widget
//             Positioned(
//               bottom: 16,
//               left: 0,
//               right: 0,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: Slider(
//                       activeColor: AppColor.black,
//                       inactiveColor: AppColor.grey,
//                       value: controller.currentPageIndex.toDouble(),
//                       onChanged: (double value) {
//                         controller.goToPage(value.toInt());
//                       },
//                       min: 0,
//                       max: elmList17.length.toDouble() - 1,
//                     ),
//                   ),
//                   // Display current page number
//                   Text(
//                     //'${controller.currentPageCounter + 1} / ${elm1List.length}',
//                     '${controller.currentPageIndex + 1.toInt()} / ${elmList17.length}',
//                     style: const TextStyle(
//                         fontSize: 18, fontWeight: FontWeight.bold),
//                   )
//                 ],
//               ),
//             )
//           ],
//         );
//       },
//     );
//   }
// }
