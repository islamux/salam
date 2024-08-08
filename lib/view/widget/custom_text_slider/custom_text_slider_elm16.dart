import 'package:elm/controller/elm16_controller.dart';
import 'package:elm/core/data/model/elm_list_model.dart';
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
    // to enable refresh ui (slider() moving)
    return GetBuilder<Elm16ControllerImp>(
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
                itemCount: elmList16.length,
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
                              GetBuilder<Elm16ControllerImp>(
                            builder: (controller) {
                              return

                                  // Rich Text Loop on rich text
                                  RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontFamily: "AmiriQ",
                                    fontSize: controller.fontSize,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    // Page 1 : titles, subtitles, texts, ayahHadiths, footer
                                    TextSpan(
                                        text: elmList16[i].titleOne,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: elmList16[i].subtitleOne1),
                                    TextSpan(text: elmList16[i].elmTextOne1),
                                    TextSpan(
                                      text: elmList16[i].ayahHadithOne,
                                      style:
                                          const TextStyle(color: AppColor.tail),
                                    ),
                                    TextSpan(text: elmList16[i].elmTextOne2),
                                    TextSpan(text: elmList16[i].subtitleOne2),
                                    TextSpan(text: elmList16[i].elmTextOne3),

                                    TextSpan(text: elmList16[i].ayahHadithOne2),
                                    TextSpan(text: elmList16[i].elmTextOne4),
                                    TextSpan(text: elmList16[i].ayahHadithOne3),
                                    TextSpan(text: elmList16[i].elmTextOne5),
                                    TextSpan(text: elmList16[i].ayahHadithOne4),
                                    TextSpan(text: elmList16[i].elmTextOne6),
                                    TextSpan(text: elmList16[i].ayahHadithOne5),
                                    TextSpan(text: elmList16[i].footerOne),

                                    // Page 2 : titles , subtitles, ayahHadiths, footers
                                    TextSpan(text: elmList16[i].elmTextTwo1),
                                    TextSpan(text: elmList16[i].ayahHadithTwo1),
                                    TextSpan(text: elmList16[i].elmTextTwo2),
                                    TextSpan(text: elmList16[i].ayahHadithTwo2),
                                    TextSpan(text: elmList16[i].elmTextTwo3),
                                    TextSpan(text: elmList16[i].ayahHadithTwo3),
                                    TextSpan(text: elmList16[i].subtitleTwo1),
                                    TextSpan(text: elmList16[i].elmTextTwo4),
                                    TextSpan(text: elmList16[i].ayahHadithTwo4),
                                    TextSpan(text: elmList16[i].elmTextTwo5),
                                    TextSpan(text: elmList16[i].footerTwo),

                                    // Page 3 : titles , subtitles, ayahHadiths, footers
                                    TextSpan(text: elmList16[i].subtitleThree1),
                                    TextSpan(
                                        text: elmList16[i].ayahHadithThree1),
                                    TextSpan(text: elmList16[i].elmTextThree1),
                                    TextSpan(text: elmList16[i].subtitleThree2),
                                    TextSpan(text: elmList16[i].elmTextThree2),
                                    TextSpan(
                                        text: elmList16[i].ayahHadithThree2),
                                    TextSpan(text: elmList16[i].subtitleThree3),
                                    TextSpan(text: elmList16[i].elmTextThree3),
                                    TextSpan(
                                        text: elmList16[i].ayahHadithThree3),
                                    TextSpan(text: elmList16[i].elmTextThree4),

                                    TextSpan(
                                        text: elmList16[i].ayahHadithThree4),
                                    TextSpan(text: elmList16[i].elmTextThree5),
                                    TextSpan(
                                        text: elmList16[i].ayahHadithThree5),
                                    TextSpan(text: elmList16[i].elmTextThree6),
                                    TextSpan(text: elmList16[i].subtitleThree4),
                                  ],
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
                      value: controller.currentPageIndex.toDouble(),
                      onChanged: (double value) {
                        controller.goToPage(value.toInt());
                      },
                      min: 0,
                      max: elmList16.length.toDouble() - 1,
                    ),
                  ),
                  // Display current page number
                  Text(
                    //'${controller.currentPageCounter + 1} / ${elm1List.length}',
                    '${controller.currentPageIndex + 1.toInt()} / ${elmList16.length}',
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
