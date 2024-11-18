import 'package:elm/core/data/model/elm_lists/elm_list_9_new_order.dart';
import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/cubit/elm_cubits/elm_9_cubit.dart';
import 'package:elm/helpers/navigation_helper.dart';
import 'package:elm/view/widget/custom_text_slider/sliders/custom_text_slider_elm9.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Elm9Page extends StatelessWidget {
  const Elm9Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Elm9Cubit(), // Provide Elm9Cubit
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
                          context.read<Elm9Cubit>().currentPageIndex;
                      context.read<Elm9Cubit>().customShareContent(
                          currentPageIndex, elmList9NewOrder);
                    },
                    icon: const Icon(Icons.share),
                  ),
                  const Text(" الخاطرة 9 "),
                ],
              ),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  context.read<Elm9Cubit>().resetCounter(); // Reset counter
                  // Navigator.pushNamed(context, RoutesConstant.home);
                  context.pushNamed(RoutesConstant.home);
                },
                child: const Icon(Icons.arrow_back),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context
                        .read<Elm9Cubit>()
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
                        .read<Elm9Cubit>()
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
                    child: CustomTextSliderElm9(), // Custom text slider
                  ),
                  // You can add additional elements like the scroll indicator here
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
