import 'package:elm/core/data/model/elm_lists/elm_list_10_new_order.dart';
import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/cubit/elm_cubits/elm_10_cubit.dart';
import 'package:elm/helpers/extensions/navigation_helper.dart';
import 'package:elm/view/widget/custom_text_slider/generic_custom_text_slider.dart'; // Changed
import 'package:elm/core/data/static/imagelink/image_link.dart'; // Added
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Elm10Page extends StatelessWidget {
  const Elm10Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Elm10Cubit(), // Provide Elm10Cubit
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
                          context.read<Elm10Cubit>().currentPageIndex;
                      context.read<Elm10Cubit>().customShareContent(
                          currentPageIndex, elmList10NewOrder);
                    },
                    icon: const Icon(Icons.share),
                  ),
                  const Text(" الخاطرة 10 "),
                ],
              ),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  context.read<Elm10Cubit>().resetCounter(); // Reset counter
                  // Navigator.pushNamed( context, RoutesConstant.home); // Navigate to home
                  context.pushNamed(RoutesConstant.home);
                },
                child: const Icon(Icons.arrow_back),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context
                        .read<Elm10Cubit>()
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
                        .read<Elm10Cubit>()
                        .increaseFontSize(); // Increase font size
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            body: SafeArea( // Removed const
              child: Column(
                children: [
                  Expanded(
                    child: GenericCustomTextSlider( // Changed
                      cubit: context.read<Elm10Cubit>(),
                      dataList: elmList10NewOrder,
                      backgroundImagePath: ImageLink.image12,
                    ),
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
