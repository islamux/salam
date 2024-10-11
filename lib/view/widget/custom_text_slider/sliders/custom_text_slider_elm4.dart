import 'package:elm/controller/elm4_controller.dart';
import 'package:elm/core/data/static/imagelink/image_link.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/view/widget/custom_text_slider/which_page_to_get/which_page_to_get_in_elm_4_new.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/data/model/elm_lists/elm_list_4_new.dart';

class CustomTextSliderElm4 extends StatelessWidget {
  const CustomTextSliderElm4({super.key});

  @override
  Widget build(BuildContext context) {
    final Elm4ControllerImp controller = Get.find<Elm4ControllerImp>();

    return GetBuilder<Elm4ControllerImp>(
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
                itemCount: elmList4New.length,
                itemBuilder: (context, i) {
                  // Determine which page content to display
                  List<TextSpan> pageTexts;
                  // pageTexts = whichPageToGetInElm3(i);
                  pageTexts = whichPageToGetInElm4New(i, elmList4New);

                  return Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 60, left: 32, right: 32, bottom: 60),
                          child: SingleChildScrollView(
                            child: GetBuilder<Elm4ControllerImp>(
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
                      max: elmList4New.length.toDouble() - 1,
                    ),
                  ),

                  // Display current page number
                  Text(
                    '${controller.currentPageIndex + 1} / ${elmList4New.length}',
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





// import 'package:elm/controller/elm4_controller.dart';
// import 'package:elm/core/data/model/elm_list_model.dart';
// import 'package:elm/core/data/model/elm_lists/elm_list_4.dart';
// import 'package:elm/core/data/static/imagelink/image_link.dart';
// import 'package:elm/core/data/static/theme/app_color_constant.dart';

// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/4/get_page_seven_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/4/get_page_eight_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/4/get_page_nine_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/4/get_page_ten_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/4/get_page_five_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/4/get_page_four_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/4/get_page_one_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/4/get_page_six_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/4/get_page_three_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/4/get_page_two_texts.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CustomTextSliderElm4 extends StatelessWidget {
//   const CustomTextSliderElm4({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final Elm4ControllerImp controllerAs = Get.find<Elm4ControllerImp>();
//     // to enable refresh ui (slider() moving)
//     return GetBuilder<Elm4ControllerImp>(
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
//                 controller: controllerAs.pageControllerAssma,
//                 onPageChanged: (index) =>
//                     // How to pass index. ==> onPageChanged(index)
//                     controllerAs.onPageChanged(index),
//                 itemCount: elmList4New.length,
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
//                               GetBuilder<Elm4ControllerImp>(
//                             builder: (controllerAs) {
//                               return // Rich Text Loop on rich text
//                                   RichText(
//                                 text: TextSpan(
//                                   style: TextStyle(
//                                     fontFamily: "AmiriQ",
//                                     fontSize: controllerAs.fontSize,
//                                     color: Colors.black,
//                                   ),
//                                   children: [
//                                     ...getPageOneTexts(i),
//                                     ...getPageTwoTexts(i),
//                                     ...getPageThreeTexts(i),
//                                     ...getPageFourTexts(i),
//                                     ...getPageFiveTexts(i),
//                                     ...getPageSixTexts(i),
//                                     ...getPageSevenTexts(i),
//                                     ...getPageEightTexts(i),
//                                     ...getPageNineTexts(i),
//                                     ...getPageTenTexts(i)
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
//                       value: controllerAs.currentPageIndex.toDouble(),
//                       onChanged: (double value) {
//                         controllerAs.goToPage(value.toInt());
//                       },
//                       min: 0,
//                       max: elmList4New.length.toDouble() - 1,
//                     ),
//                   ),
//                   // Display current page number
//                   Text(
//                     //'${controllerAs.currentPageCounter + 1} / ${elm1List.length}',
//                     '${controllerAs.currentPageIndex + 1.toInt()} / ${elmList4New.length}',
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
