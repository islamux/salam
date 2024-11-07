import 'package:elm/core/data/model/elm_lists/elm_list_20_new.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_20_new_order.dart';
import 'package:elm/cubit/base_cubit/base_page_state.dart'; // Import BasePageState for managing state
import 'package:elm/core/data/static/imagelink/image_link.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/cubit/elm_cubits/elm_20_cubit.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/get_page_one_texts_order.dart';
import 'package:elm/view/widget/custom_text_slider/which_page_to_get/which_page_to_get_in_elm_20_new.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Required for Bloc/Cubit

class CustomTextSliderElm20 extends StatelessWidget {
  const CustomTextSliderElm20({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Elm20Cubit, BasePageState>(
      // Use BlocBuilder to listen for state changes
      builder: (context, state) {
        Elm20Cubit cubit = context.read<Elm20Cubit>(); // Access the Elm10Cubit

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
                controller: cubit.pageController, // Use cubit's page controller
                onPageChanged: (index) =>
                    cubit.onPageChanged(index), // Handle page change
                itemCount: elmList20NewOrder.length, // Total number of pages
                itemBuilder: (context, i) {
                  // Determine which page content to display
                  List<TextSpan> pageTexts = getPageTexts(i, elmList20NewOrder);

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
                                  fontFamily: 'AmiriQ',
                                  fontSize: cubit
                                      .fontSize, // Get font size from cubit
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
                      value: (cubit.currentPageIndex ?? 0)
                          .toDouble(), // Use current page index from cubit
                      onChanged: (double value) {
                        cubit.goToPage(
                            value.toInt()); // Navigate to selected page
                      },
                      min: 0,
                      max: elmList20NewOrder.length.toDouble() -
                          1, // Maximum number of pages
                    ),
                  ),

                  // Display current page number
                  Text(
                    '${(cubit.currentPageIndex ?? 0) + 1} / ${elmList20NewOrder.length}', // Current page number display
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
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
