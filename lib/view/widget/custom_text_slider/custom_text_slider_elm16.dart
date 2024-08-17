import 'package:elm/controller/elm16_controller.dart';
import 'package:elm/core/data/static/imagelink/image_link.dart';
import 'package:elm/core/data/static/text/elm_text_ders_sixteen.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/view/widget/custom_text_slider/pages_texts/get_page_one_texts.dart';
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
              // to fix auto size of height of text
              height: MediaQuery.of(context).size.height,
              child: PageView.builder(
                reverse: true,
                controller: controller.pageControllerAssma,
                onPageChanged: (index) => controller.onPageChanged(index),
                itemCount: ElmTextDersSixteen.getPagesLength(),
                itemBuilder: (context, i) => Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 60, left: 32, right: 32, bottom: 60),
                        child: SingleChildScrollView(
                          child: GetBuilder<Elm16ControllerImp>(
                            builder: (controller) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (i == 0) ...[
                                    _buildRichText(getPageOneTexts(0)),
                                    // Additional RichText for page 1
                                    _buildRichText(getPageOneTexts(1)),
                                    _buildRichText(getPageOneTexts(2)),
                                  ] else if (i == 1) ...[
                                    _buildRichText(getPageOneTexts(3)),
                                    _buildRichText(getPageOneTexts(4)),
                                  ] else if (i == 2) ...[
                                    _buildRichText(getPageOneTexts(5)),
                                  ],
                                ],
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
                      max: ElmTextDersSixteen.getPagesLength().toDouble() - 1,
                    ),
                  ),
                  // Display current page number
                  Text(
                    '${controller.currentPageIndex + 1} / ${ElmTextDersSixteen.getPagesLength()}',
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

  // Helper method to create a RichText widget
  RichText _buildRichText(List<TextSpan> textSpans) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontFamily: "AmiriQ",
          fontSize: 18,
          color: Colors.black,
        ),
        children: textSpans,
      ),
      textAlign: TextAlign.right,
    );
  }
}
