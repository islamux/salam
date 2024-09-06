import 'package:elm/controller/elm13_controller.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_13.dart';
import 'package:elm/core/data/static/imagelink/image_link.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/view/widget/custom_text_slider/which_page_to_get/which_page_to_get_in_elm_13.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextSliderElm13 extends StatelessWidget {
  const CustomTextSliderElm13({super.key});

  @override
  Widget build(BuildContext context) {
    final Elm13ControllerImp controller = Get.find<Elm13ControllerImp>();

    return GetBuilder<Elm13ControllerImp>(
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
                itemCount: elmList13.length,
                itemBuilder: (context, i) => Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 60, left: 32, right: 32, bottom: 60),
                        child: SingleChildScrollView(
                          child: GetBuilder<Elm13ControllerImp>(
                            builder: (controller) {
                              // Determine which page content to display
                              List<TextSpan> pageTexts;
                              pageTexts = whichPageToGetInElm13(i);

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
                      max: elmList13.length.toDouble() - 1,
                    ),
                  ),
                  Text(
                    '${controller.currentPageIndex + 1} / ${elmList13.length}',
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

// class CustomTextSliderElm13 extends StatelessWidget {
//   const CustomTextSliderElm13({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final Elm13ControllerImp controllerAs = Get.find<Elm13ControllerImp>();
//     // to enable refresh ui (slider() moving)
//     return GetBuilder<Elm13ControllerImp>(
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
//                 itemCount: elmList13.length,
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
//                               GetBuilder<Elm13ControllerImp>(
//                             builder: (controllerAs) {
//                               return RichText(
//                                   text: TextSpan(
//                                       style: TextStyle(
//                                         fontFamily: "AmiriQ",
//                                         fontSize: controllerAs.fontSize,
//                                         color: Colors.black,
//                                       ),
//                                       children: [
//                                         ...getPageOneTexts(i),
//                                         ...getPageTwoTexts(i),
//                                         ...getPageThreeTexts(i),
//                                         ...getPageFourTexts(i),
//                                         ...getPageFiveTexts(i),
//                                         ...getPageSixTexts(i),
//                                         ...getPageSevenTexts(i),
//                                         ...getPageEightTexts(i),
//                                         ...getPageNineTexts(i),
//                                         ...getPageTenTexts(i),
//                                         ...getPageElevenTexts(i),
//                                         ...getPageTwelveTexts(i),
//                                         ...getPageeTherteenTexts(i)
//                                       ]),
//                                   textAlign: TextAlign.right);
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
//                       max: elmList13.length.toDouble() - 1,
//                     ),
//                   ),
//                   // Display current page number
//                   Text(
//                     //'${controllerAs.currentPageCounter + 1} / ${elm1List.length}',
//                     '${controllerAs.currentPageIndex + 1.toInt()} / ${elmList13.length}',
//                     // to make page start with 1
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
