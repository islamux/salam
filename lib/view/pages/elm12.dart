import 'package:elm/core/data/model/elm_lists/elm_list_12_new.dart';
import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/cubit/elm_cubits/elm_12_cubit.dart';
import 'package:elm/view/widget/custom_text_slider/sliders/custom_text_slider_elm12.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Elm12Page extends StatelessWidget {
  const Elm12Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Elm12Cubit(), // Provide Elm12Cubit
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
                          context.read<Elm12Cubit>().currentPageIndex;
                      context
                          .read<Elm12Cubit>()
                          .customShareContent(currentPageIndex, elmList12New);
                    },
                    icon: const Icon(Icons.share),
                  ),
                  const Text("الخاطرة 12  "),
                ],
              ),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  context.read<Elm12Cubit>().resetCounter(); // Reset counter
                  Navigator.pushNamed(
                      context, RoutesConstant.home); // Navigate to home
                },
                child: const Icon(Icons.arrow_back),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context
                        .read<Elm12Cubit>()
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
                        .read<Elm12Cubit>()
                        .increaseFontSize(); // Increase font size
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            body: const SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: CustomTextSliderElm12(), // Custom text slider
                  ),
                  // Additional elements can be added here if needed
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
