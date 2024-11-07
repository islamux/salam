import 'package:elm/core/data/model/elm_lists/elm_list_9_new_order.dart';
import 'package:elm/cubit/base_cubit/base_page_state.dart'; // Import BasePageState
import 'package:elm/core/data/static/imagelink/image_link.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/cubit/elm_cubits/elm_9_cubit.dart';
import 'package:elm/view/widget/custom_text_slider/get_page_texts_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Required for Bloc/Cubit

class CustomTextSliderElm9 extends StatelessWidget {
  const CustomTextSliderElm9({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Elm9Cubit, BasePageState>(
      // Use BlocBuilder with Elm9Cubit
      builder: (context, state) {
        Elm9Cubit cubit = context.read<Elm9Cubit>(); // Access the Elm9Cubit

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
                itemCount: elmList9NewOrder.length, // Total number of pages
                itemBuilder: (context, i) {
                  // Determine which page content to display
                  List<TextSpan> pageTexts = getPageTexts(i, elmList9NewOrder);

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
                          .toDouble(), // Current page index from cubit
                      onChanged: (double value) {
                        cubit.goToPage(
                            value.toInt()); // Navigate to selected page
                      },
                      min: 0,
                      max: elmList9NewOrder.length.toDouble() -
                          1, // Maximum number of pages
                    ),
                  ),

                  // Display current page number
                  Text(
                    '${(cubit.currentPageIndex ?? 0) + 1} / ${elmList9NewOrder.length}', // Handle current page and total pages
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
