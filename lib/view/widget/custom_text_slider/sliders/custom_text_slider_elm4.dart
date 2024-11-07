import 'package:elm/cubit/base_cubit/base_page_state.dart'; // Import BasePageState
import 'package:elm/core/data/model/elm_lists/elm_list_4_new.dart';
import 'package:elm/core/data/static/imagelink/image_link.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/cubit/elm_cubits/elm_4_cubit.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/get_page_one_texts_order.dart';
import 'package:elm/view/widget/custom_text_slider/which_page_to_get/which_page_to_get_in_elm_4_new.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/model/elm_lists/elm_list_4_new_order.dart'; // Required for Bloc/Cubit

class CustomTextSliderElm4 extends StatelessWidget {
  const CustomTextSliderElm4({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Elm4Cubit, BasePageState>(
      // BlocBuilder to listen to Elm4Cubit
      builder: (context, state) {
        Elm4Cubit cubit = context.read<Elm4Cubit>(); // Access Elm4Cubit

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
                controller: cubit.pageController, // Use cubit's page controller
                onPageChanged: (index) =>
                    cubit.onPageChanged(index), // Handle page change
                itemCount: elmList4NewOrder.length, // Total pages
                itemBuilder: (context, i) {
                  // Fetch the content of the current page
                  List<TextSpan> pageTexts = getPageTexts(i, elmList4NewOrder);

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
                                  fontSize:
                                      cubit.fontSize, // Font size from cubit
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
                          .toDouble(), // Current page index from cubit
                      onChanged: (double value) {
                        cubit.goToPage(
                            value.toInt()); // Move to selected page via cubit
                      },
                      min: 0,
                      max: elmList4NewOrder.length.toDouble() -
                          1, // Maximum number of pages
                    ),
                  ),

                  // Display current page number
                  Text(
                    '${(cubit.currentPageIndex ?? 0) + 1} / ${elmList4NewOrder.length}', // Handle current page and total pages
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
