import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/cubit/base_cubit/base_page_cubit.dart';
import 'package:elm/cubit/base_cubit/base_page_state.dart';
import 'package:elm/view/widget/custom_text_slider/get_page_texts_order.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';

class GenericCustomTextSlider extends StatelessWidget {
  final BasePageCubit cubit;
  final List<ElmModelNewOrder> dataList;
  final String backgroundImagePath;

  const GenericCustomTextSlider({
    Key? key,
    required this.cubit,
    required this.dataList,
    required this.backgroundImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasePageCubit, BasePageState>(
      bloc: cubit,
      builder: (context, state) {
        return Stack(
          children: [
            // Background Image
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(backgroundImagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // PageView
            SizedBox(
              height: MediaQuery.of(context).size.height, // Corrected height
              child: PageView.builder(
                reverse: true,
                controller: cubit.pageController,
                onPageChanged: (index) => cubit.onPageChanged(index),
                itemCount: dataList.length,
                itemBuilder: (BuildContext context, int i) {
                  return Column( // Added Column
                    children: [
                      Expanded( // Added Expanded
                        child: Container( // Added Container
                          padding: const EdgeInsets.only(top: 60, left: 32, right: 32, bottom: 60), // Corrected padding
                          child: SingleChildScrollView(
                            child: RichText(
                              textAlign: TextAlign.right, // Corrected textAlign
                              text: getPageTexts(i, dataList), // Corrected getPageTexts call
                              style: TextStyle(
                                fontFamily: "AmiriQ",
                                fontSize: cubit.fontSize,
                                color: Colors.black, // Corrected color
                                // height: 1.8, // Removed height
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            // Slider and Page Number
            Positioned(
              bottom: 16, // Corrected bottom position
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Slider(
                    value: (cubit.currentPageIndex ?? 0).toDouble(),
                    onChanged: (double value) => cubit.goToPage(value.toInt()),
                    min: 0,
                    max: dataList.isEmpty ? 0 : dataList.length.toDouble() -1 ,
                    activeColor: AppColor.black, // Corrected activeColor
                    inactiveColor: AppColor.grey, // Corrected inactiveColor
                  ),
                  Text(
                    '${(cubit.currentPageIndex ?? 0) + 1} / ${dataList.length}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Corrected style
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
