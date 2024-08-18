// import 'package:elm/controller/elm16_controller.dart';
// import 'package:elm/core/data/model/kahtira_page_content.dart';
// import 'package:elm/core/data/static/imagelink/image_link.dart';
// import 'package:elm/core/data/static/text/elm_text_ders_sixteen.dart';
// import 'package:elm/core/data/static/theme/app_color_constant.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CustomTextSliderElm16 extends StatelessWidget {
//   const CustomTextSliderElm16({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final Elm16ControllerImp controller = Get.find<Elm16ControllerImp>();
//       final KhatriaPageContent page;

//     // to enable refresh ui (slider() moving)
//     return GetBuilder<Elm16ControllerImp>(
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
//               // to fix auto size of height of text
//               height: MediaQuery.of(context).size.height,
//               child: PageView.builder(
//                 reverse: true,
//                 controller: controller.pageControllerAssma,
//                 onPageChanged: (index) => controller.onPageChanged(index),
//                 itemCount: ElmTextDersSixteen.getPagesLength(),
//                 itemBuilder: (context, i) => Column(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         padding: const EdgeInsets.only(
//                             top: 60, left: 32, right: 32, bottom: 60),
//                         child: SingleChildScrollView(
//                           child: GetBuilder<Elm16ControllerImp>(
//                             builder: (controller) {
//                               return Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   if (page.title != null)
//           Text(page.title!, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//         if (page.subtitle != null)
//           Text(page.subtitle!, style: const TextStyle(fontSize: 20)),
//         if (page.text != null)
//           Text(page.text!, style: const TextStyle(fontSize: 18)),
//         if (page.ayahHadith != null)
//           Text(page.ayahHadith!, style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
//         if (page.footer != null)
//           Text(page.footer!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),

//                                   ],
//                                 ],
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
//             // Slider widget
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
//                       max: ElmTextDersSixteen.getPagesLength().toDouble() - 1,
//                     ),
//                   ),
//                   // Display current page number
//                   Text(
//                     '${controller.currentPageIndex + 1} / ${ElmTextDersSixteen.getPagesLength()}',
//                     style: const TextStyle(
//                         fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

import 'package:elm/controller/elm16_controller.dart';
import 'package:elm/core/data/model/kahtira_page_content.dart';
import 'package:elm/core/data/static/imagelink/image_link.dart';
import 'package:elm/core/data/static/text/elm_text_ders_sixteen.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextSliderElm16 extends StatelessWidget {
  const CustomTextSliderElm16({super.key});

  @override
  Widget build(BuildContext context) {
    final Elm16ControllerImp controller = Get.find<Elm16ControllerImp>();

    // Enable UI refresh (slider movement)
    return GetBuilder<Elm16ControllerImp>(
      builder: (_) {
        return Stack(
          children: [
            // Background Image in Stack
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
                itemCount: ElmTextDersSixteen.pages.length,
                itemBuilder: (context, i) {
                  // first fix to access to pages => pages[i]
                  final KhatiraPageContent page = ElmTextDersSixteen.pages[i];

                  return Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 60, left: 32, right: 32, bottom: 60),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // second fix : using if to check if the model is not null --> use it (it make the code more clean and remove all rabish code, spagity code)
                                if (page.title != null)
                                  Text(page.title!,
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold)),
                                if (page.subtitle != null)
                                  Text(page.subtitle!,
                                      style: const TextStyle(fontSize: 20)),
                                if (page.text != null)
                                  Text(page.text!,
                                      style: const TextStyle(fontSize: 18)),
                                if (page.ayahHadith != null)
                                  Text(page.ayahHadith!,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontStyle: FontStyle.italic)),
                                if (page.footer != null)
                                  Text(page.footer!,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                              ],
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
                      max: ElmTextDersSixteen.pages.length.toDouble() - 1,
                    ),
                  ),
                  // Display current page number
                  Text(
                    '${controller.currentPageIndex + 1} / ${ElmTextDersSixteen.pages.length}',
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
