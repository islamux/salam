import 'package:elm/core/data/model/elm_lists/elm_list_5_new_order.dart';
import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/cubit/elm_cubits/elm_5_cubit.dart';
import 'package:elm/helpers/extensions/navigation_helper.dart';
import 'package:elm/view/widget/custom_text_slider/sliders/custom_text_slider_elm5.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Elm5Page extends StatelessWidget {
  const Elm5Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Elm5Cubit(), // Provide Elm5Cubit
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.black,
              foregroundColor: AppColor.amber,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    // Share content using cubit
                    onPressed: () {
                      final currentPageIndex =
                          context.read<Elm5Cubit>().currentPageIndex;
                      context.read<Elm5Cubit>().customShareContent(
                          currentPageIndex, elmList5NewOrder);
                    },
                    icon: const Icon(Icons.share),
                  ),
                  const Text(" الخاطرة 5 "),
                ],
              ),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  context
                      .read<Elm5Cubit>()
                      .resetCounter(); // Reset counter before going back
                  // Navigator.pushNamed(context, RoutesConstant.home);
                  context.pushNamed(RoutesConstant.home);
                },
                child: const Icon(Icons.arrow_back),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context
                        .read<Elm5Cubit>()
                        .decreaseFontSize(); // Decrease font size
                  },
                  icon: const Icon(Icons.remove),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("الخط"), // Font label
                  ],
                ),
                IconButton(
                  onPressed: () {
                    context
                        .read<Elm5Cubit>()
                        .increaseFontSize(); // Increase font size
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            body: SafeArea(
              child: GestureDetector(
                onTap: () {
                  Feedback.forTap(context); // Add feedback when tapping
                },
                child: const CustomTextSliderElm5(), // Custom text slider
              ),
            ),
          );
        },
      ),
    );
  }
}
