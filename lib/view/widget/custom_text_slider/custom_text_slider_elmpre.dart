import 'package:elm/controller/elmpre_controller.dart';
import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/imagelink/image_link.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextSliderElmPre extends StatelessWidget {
  const CustomTextSliderElmPre({super.key});

  @override
  Widget build(BuildContext context) {
    final ElmPreControllerImp controllerAs =
        Get.find<ElmPreControllerImp>();
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
                controller: controllerAs.pageControllerAssma,
                onPageChanged: (index) =>
                    // How to pass index. ==> onPageChanged(index)
                    controllerAs.onPageChanged(index),
                itemCount: elmListPre.length,
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
                              GetBuilder<ElmPreControllerImp>(
                            builder: (controllerAs) {
                              return Text(
                                elmListPre[i].elmText ?? '',
                                // Provide a default value (?? '') in case duaText is null
                                style: //AppTheme.goldenTheme.textTheme.bodyLarge,
                                    TextStyle(
                                  // Problem here is fontsize need to hotreload why?
                                  // I found the solution by wrab Text with GetBuilder to refresh only the
                                  // widgt not all page
                                  fontSize:
                                      //Get.find<ElmPreControllerImp>().fontSize,
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
            // slider here if you want to add 
          
          ],
        );
      },
    );
  }
}
