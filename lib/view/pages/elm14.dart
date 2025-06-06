import 'package:elm/core/data/model/elm_lists/elm_list_14_new_order.dart'; // Corrected import
import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/cubit/elm_cubits/elm_14_cubit.dart';
import 'package:elm/helpers/extensions/navigation_helper.dart';
import 'package:elm/view/widget/custom_text_slider/generic_custom_text_slider.dart'; // Changed
import 'package:elm/core/data/static/imagelink/image_link.dart'; // Added
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Elm14Page extends StatelessWidget {
  const Elm14Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Elm14Cubit(), // Provide Elm14Cubit
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
                          context.read<Elm14Cubit>().currentPageIndex;
                      context.read<Elm14Cubit>().customShareContent(
                          currentPageIndex, elmList14NewOrder); // Corrected dataList
                    },
                    icon: const Icon(Icons.share),
                  ),
                  const Text("الخاطرة 14 "),
                ],
              ),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  context.read<Elm14Cubit>().resetCounter(); // Reset counter
                  // Navigator.pushNamed(
                  //     context, RoutesConstant.home); // Navigate to home
                  context.pushNamed(RoutesConstant.home);
                },
                child: const Icon(Icons.arrow_back),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context
                        .read<Elm14Cubit>()
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
                        .read<Elm14Cubit>()
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
                      cubit: context.read<Elm14Cubit>(),
                      dataList: elmList14NewOrder, // Corrected dataList
                      backgroundImagePath: ImageLink.image12,
                    ),
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
