import 'package:elm/core/data/model/elm_lists/elm_list_2_new_order.dart';
import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/cubit/elm_cubits/elm_2_cubit.dart';
import 'package:elm/helpers/extensions/navigation_helper.dart';
import 'package:elm/view/widget/custom_text_slider/generic_custom_text_slider.dart'; // Changed
import 'package:elm/core/data/static/imagelink/image_link.dart'; // Added
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Elm2Page extends StatelessWidget {
  const Elm2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Elm2Cubit(), // Provide the Elm2Cubit
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
                          context.read<Elm2Cubit>().currentPageIndex;
                      context.read<Elm2Cubit>().customShareContent(
                          currentPageIndex, elmList2NewOrder);
                    },
                    icon: const Icon(Icons.share),
                  ),
                  const Text(
                    "الخاطرة 2",
                  ),
                ],
              ),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  context
                      .read<Elm2Cubit>()
                      .resetCounter(); // Reset counter before going back

                  //  Navigator.pushNamed(context, RoutesConstant.home);
                  context.pushNamed(RoutesConstant.home);
                },
                child: const Icon(Icons.arrow_back),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context
                        .read<Elm2Cubit>()
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
                        .read<Elm2Cubit>()
                        .increaseFontSize(); // Increase font size
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            body: SafeArea(
              child: GestureDetector( // GestureDetector can likely be removed if not needed for other purposes
                onTap: () {
                  Feedback.forTap(context); 
                },
                child: GenericCustomTextSlider( // Changed
                  cubit: context.read<Elm2Cubit>(),
                  dataList: elmList2NewOrder,
                  backgroundImagePath: ImageLink.image12,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
