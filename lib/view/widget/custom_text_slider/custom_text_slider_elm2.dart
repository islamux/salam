import 'package:elm/controller/elm2_controller.dart';
import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/imagelink/image_link.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextSliderElm2 extends StatelessWidget {
  const CustomTextSliderElm2({super.key});

  @override
  Widget build(BuildContext context) {
    final Elm2ControllerImp controllerAs =
        Get.find<Elm2ControllerImp>();
    // to enable refresh ui (slider() moving)
    return GetBuilder<Elm2ControllerImp>(
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
                controller: controllerAs.pageControllerAssma,
                onPageChanged: (index) =>
                    // How to pass index. ==> onPageChanged(index)
                    controllerAs.onPageChanged(index),
                itemCount: elmList2.length,
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
                              GetBuilder<Elm2ControllerImp>(
                            builder: (controllerAs) {
                              return Text(
                                elmList2[i].elmText ?? '',
                                // Provide a default value (?? '') in case duaText is null
                                style: //AppTheme.goldenTheme.textTheme.bodyLarge,
                                    TextStyle(
                                  // Problem here is fontsize need to hotreload why?
                                  // I found the solution by wrab Text with GetBuilder to refresh only the
                                  // widgt not all page
                                  fontSize:
                                      //Get.find<Elm2ControllerImp>().fontSize,
                                      controllerAs.fontSize,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "AmiriQ",
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
                      value: controllerAs.currentPageIndex.toDouble(),
                      onChanged: (double value) {
                        controllerAs.goToPage(value.toInt());
                      },
                      min: 0,
                      max: elmList2.length.toDouble() - 1,
                    ),
                  ),
                  // Display current page number
                  Text(
                    //'${controllerAs.currentPageCounter + 1} / ${elm1List.length}',
                    '${controllerAs.currentPageIndex+1.toInt()} / ${elmList2.length}',
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
