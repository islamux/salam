import 'package:elm/core/data/model/elm_lists/elm_list_final_new_order.dart';
import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/cubit/elm_cubits/elm_final_cubit.dart';
import 'package:elm/helpers/extensions/navigation_helper.dart';
import 'package:elm/view/widget/custom_text_slider/generic_custom_text_slider.dart'; // Changed
import 'package:elm/core/data/static/imagelink/image_link.dart'; // Added
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElmFinalPage extends StatelessWidget {
  const ElmFinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FinalCubit(), // Provide Elm22Cubit
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
                          context.read<FinalCubit>().currentPageIndex;
                      context.read<FinalCubit>().customShareContent(
                          currentPageIndex, finalListNewOrder);
                    },
                    icon: const Icon(Icons.share),
                  ),
                  const Text(
                    "الخاتمة", // Changed title
                    style: TextStyle(
                      color: AppColor.primaryColorGolden,
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  context.read<FinalCubit>().resetCounter(); 
                  context.pushNamed(RoutesConstant.home);
                },
                child: const Icon(Icons.arrow_back),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context
                        .read<FinalCubit>()
                        .decreaseFontSize(); 
                  },
                  icon: const Icon(Icons.remove),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("الخط"), 
                  ],
                ),
                IconButton(
                  onPressed: () {
                    context
                        .read<FinalCubit>()
                        .increaseFontSize(); 
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
                      cubit: context.read<FinalCubit>(),
                      dataList: finalListNewOrder,
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
