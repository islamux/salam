import 'package:elm/cubit/base_cubit/base_page_state.dart'; // Importing base page state
import 'package:elm/core/data/static/imagelink/image_link.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/cubit/elm_cubits/elm_3_cubit.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/get_page_texts_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/model/elm_lists/elm_list_3_new_order.dart';

class CustomTextSliderElm3 extends StatelessWidget {
  const CustomTextSliderElm3({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Elm3Cubit, BasePageState>(
      // Using BlocBuilder for Elm3Cubit
      builder: (context, state) {
        Elm3Cubit cubit = context.read<Elm3Cubit>(); // Accessing Elm3Cubit

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
                controller: cubit.pageController, // Use cubit's PageController
                onPageChanged: (index) =>
                    cubit.onPageChanged(index), // Handle page change
                itemCount: elmList3NewOrder.length,
                itemBuilder: (context, i) {
                  // Get the content of the current page
                  List<TextSpan> pageTexts = getPageTexts(i, elmList3NewOrder);

                  return Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 60, left: 32, right: 32, bottom: 60),
                          child: SingleChildScrollView(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontFamily: "AmiriQ",
                                  fontSize: cubit
                                      .fontSize, // Access the font size from cubit
                                  color: Colors.black,
                                ),
                                children: pageTexts,
                              ),
                              textAlign: TextAlign.right,
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
                      value: (cubit.currentPageIndex ?? 0)
                          .toDouble(), // Null check added
                      onChanged: (double value) {
                        cubit.goToPage(
                            value.toInt()); // Handle slider change with cubit
                      },
                      min: 0,
                      max: elmList3NewOrder.length.toDouble() - 1,
                    ),
                  ),

                  // Display current page number
                  Text(
                    '${(cubit.currentPageIndex ?? 0) + 1} / ${elmList3NewOrder.length}', // Null check added
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
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
