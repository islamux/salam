import 'package:elm/core/data/model/elm_lists/elm_list_1_new_order.dart';
import 'package:elm/cubit/base_cubit/base_page_state.dart';
import 'package:elm/core/data/static/imagelink/image_link.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/cubit/elm_cubits/elm_1_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../get_pages_texts/get_page_texts_order.dart';

class CustomTextSliderElm1 extends StatelessWidget {
  const CustomTextSliderElm1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Elm1Cubit, BasePageState>(
      // Use BlocBuilder with Elm1Cubit
      builder: (context, state) {
        Elm1Cubit cubit =
            context.read<Elm1Cubit>(); // Get the Elm1Cubit instance

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
                controller:
                    cubit.pageController, // Use the pageController from cubit
                onPageChanged: (index) =>
                    cubit.onPageChanged(index), // Update page index using cubit
                itemCount: elmList1NewOrder.length,
                itemBuilder: (context, i) {
                  // Get page texts from cubit
                  List<TextSpan> pageTexts = getPageTexts(i, elmList1NewOrder);

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
                            value.toInt()); // Use cubit's page control method
                      },
                      min: 0,
                      max: elmList1NewOrder.length.toDouble() - 1,
                    ),
                  ),
                  Text(
                    '${(cubit.currentPageIndex ?? 0) + 1} / ${elmList1NewOrder.length}', // Null check added
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
