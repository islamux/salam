import 'package:elm/controller/elm3_controller.dart';
import 'package:elm/core/data/static/imagelink/image_link.dart';
import 'package:elm/core/data/static/text/elm_text_ders_three.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextSliderElm3 extends StatelessWidget {
  const CustomTextSliderElm3({super.key});

  @override
  Widget build(BuildContext context) {
    final Elm3ControllerImp controller = Get.find<Elm3ControllerImp>();

    // Split the text into pages based on the screen size
    final List<List<InlineSpan>> paginatedText = _splitTextIntoPages(
      ElmTextDersThree.pages.map((page) => page.content).toList(),
      context,
    );

    return GetBuilder<Elm3ControllerImp>(
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
            // PageView to display paginated text
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: PageView.builder(
                reverse: true,
                controller: controller.pageControllerAssma,
                onPageChanged: (index) => controller.onPageChanged(index),
                itemCount: paginatedText.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 60, horizontal: 32),
                          child: SingleChildScrollView(
                            child: GetBuilder<Elm3ControllerImp>(
                              builder: (controller) {
                                return RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontFamily: "AmiriQ",
                                      fontSize: controller.fontSize,
                                      color: Colors.black,
                                    ),
                                    children: paginatedText[i],
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
                      max: paginatedText.length.toDouble() - 1,
                    ),
                  ),
                  Text(
                    '${controller.currentPageIndex + 1} / ${paginatedText.length}',
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

  // Function to split text into pages
  List<List<InlineSpan>> _splitTextIntoPages(
      List<List<InlineSpan>> textContent, BuildContext context) {
    final textPainter = TextPainter(
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
    );
    final List<List<InlineSpan>> pages = [];
    final double pageHeight =
        MediaQuery.of(context).size.height - 120; // Adjust height for padding

    List<InlineSpan> currentPage = [];
    double currentPageHeight = 0;
    double averageHeight = 0;
    int spanCount = 0;

    for (var pageContent in textContent) {
      for (var span in pageContent) {
        currentPage.add(span);
        textPainter.text = TextSpan(children: currentPage);
        textPainter.layout(maxWidth: MediaQuery.of(context).size.width - 64);

        if (spanCount < 10) {
          // حساب متوسط ارتفاع النص في الصفحة الأولى
          averageHeight += textPainter.height;
          spanCount++;
        }

        if (currentPageHeight + textPainter.height >
            (averageHeight / spanCount) * 5) {
          pages.add(List.from(currentPage)..removeLast());
          currentPage = [span];
          currentPageHeight = textPainter.height;
        } else {
          currentPageHeight += textPainter.height;
        }
      }
    }

    if (currentPage.isNotEmpty) {
      pages.add(currentPage);
    }

    return pages;
  }
}
