import 'package:elm/core/data/model/elm_lists/elm_list_6_new_order.dart';
import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/cubit/elm_cubits/elm_6_cubit.dart';
import 'package:elm/helpers/navigation_helper.dart';
import 'package:elm/view/widget/custom_text_slider/sliders/custom_text_slider_elm6.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Elm6Page extends StatelessWidget {
  const Elm6Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Elm6Cubit(), // Provide Elm6Cubit
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
                          context.read<Elm6Cubit>().currentPageIndex;
                      context.read<Elm6Cubit>().customShareContent(
                          currentPageIndex, elmList6NewOrder);
                    },
                    icon: const Icon(Icons.share),
                  ),
                  const Text(" الخاطرة 6 "),
                ],
              ),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  context
                      .read<Elm6Cubit>()
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
                        .read<Elm6Cubit>()
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
                        .read<Elm6Cubit>()
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
                child: const CustomTextSliderElm6(), // Custom text slider
              ),
            ),
          );
        },
      ),
    );
  }
}
