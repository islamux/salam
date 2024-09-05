import 'package:elm/controller/elm11_controller.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_11.dart';
import 'package:elm/core/data/static/imagelink/image_link.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/11/get_page_eight_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/11/get_page_ninteen_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/11/get_page_eighteen_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/11/get_page_eleven_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/11/get_page_fifteen_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/11/get_page_five_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/11/get_page_four_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/11/get_page_fourteen_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/11/get_page_nine_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/11/get_page_one_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/11/get_page_seven_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/11/get_page_six_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/11/get_page_sixteen_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/11/get_page_seventeen_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/11/get_page_ten_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/11/get_page_therteen_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/11/get_page_three_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/11/get_page_twelve_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/11/get_page_twenty_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/11/get_page_two_texts.dart';

class CustomTextSliderElm11 extends StatelessWidget {
  const CustomTextSliderElm11({super.key});

  @override
  Widget build(BuildContext context) {
    final Elm11ControllerImp controller = Get.find<Elm11ControllerImp>();

    return GetBuilder<Elm11ControllerImp>(
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
                itemCount: elmList11.length,
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
                      pageTexts = getPageSeventeenTexts(i);
                      break;
                    case 17:
                      pageTexts = getPageEigteenTexts(i);
                      break;
                    case 18:
                      pageTexts = getPageNinteenTexts(i);
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
                            child: GetBuilder<Elm11ControllerImp>(
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
                      max: elmList11.length.toDouble() - 1,
                    ),
                  ),
                  // Display current page number
                  Text(
                    '${controller.currentPageIndex + 1} / ${elmList11.length}',
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



// class CustomTextSliderElm11 extends StatelessWidget {
//   const CustomTextSliderElm11({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final Elm11ControllerImp controller = Get.find<Elm11ControllerImp>();
//     // to enable refresh ui (slider() moving)
//     return GetBuilder<Elm11ControllerImp>(
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
//                 itemCount: elmList11.length,
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
//                               GetBuilder<Elm11ControllerImp>(
//                             builder: (controller) {
//                               return // Rich Text Loop on rich text
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
//                                     ...getPageTwelveTexts(i),
//                                     ...getPageTherteenTexts(i),
//                                     ...getPageFourteenTexts(i),
//                                     ...getPageFifteenTexts(i),
//                                     ...getPageSixteenTexts(i),
//                                     ...getPageSeventeenTexts(i),
//                                     ...getPageEigteenTexts(i),
//                                     ...getPageNinteenTexts(i),
//                                     ...getPageTwentyTexts(i),
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
//                       max: elmList11.length.toDouble() - 1,
//                     ),
//                   ),
//                   // Display current page number
//                   Text(
//                     //'${controller.currentPageCounter + 1} / ${elm1List.length}',
//                     '${controller.currentPageIndex + 1.toInt()} / ${elmList11.length}',
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
