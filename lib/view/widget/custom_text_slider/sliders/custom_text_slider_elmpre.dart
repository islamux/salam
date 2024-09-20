import 'package:elm/controller/elmpre_controller/elmpre_controller.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_pre.dart';
import 'package:elm/core/data/static/imagelink/image_link.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/view/widget/custom_text_slider/which_page_to_get/which_page_to_get_in_elm_pre.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextSliderElmPre extends StatelessWidget {
  const CustomTextSliderElmPre({super.key});

  @override
  Widget build(BuildContext context) {
    final ElmPreControllerImp controller = Get.find<ElmPreControllerImp>();
    // to enable refresh ui (slider() moving)
    return GetBuilder<ElmPreControllerImp>(
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
                  controller: controller.pageControllerAssma,
                  onPageChanged: (index) =>
                      // How to pass index. ==> onPageChanged(index)
                      controller.onPageChanged(index),
                  itemCount: elmListPre.length,
                  itemBuilder: (context, i) {
                    // Determine wich page content to display
                    List<TextSpan> pageTexts;
                    pageTexts = whichPageToGetInPre(i);

                    return Column(
                      children: [
                        // To make text scrollable make insid contatiner and the container inside Expanded
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 60, left: 32, right: 32, bottom: 60),
                            child: SingleChildScrollView(
                              child:
                                  // To make font change when click on button wrab Text() with GetBuilder<Page1controllerImp>(build: (controller) return Text())
                                  GetBuilder<ElmPreControllerImp>(
                                builder: (controllerAs) {
                                  return RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontFamily: "AmiriQ",
                                        fontSize: controllerAs.fontSize,
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
                  }),
            ),
            // slider here if you want to add
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
                      max: elmListPre.length.toDouble() - 1,
                    ),
                  ),
                  Text(
                    '${controller.currentPageIndex + 1} / ${elmListPre.length}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
