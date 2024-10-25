import 'package:elm/core/data/model/elm_lists/elm_list_pre_new.dart';
import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/cubit/elm_cubits/elm_pre_cubit.dart';
import 'package:elm/view/widget/custom_text_slider/sliders/custom_text_slider_elmpre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElmPrePage extends StatelessWidget {
  const ElmPrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ElmPreCubit(),
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
                    // Share content with cubit
                    onPressed: () {
                      print("share button pressed ...........\n");
                      final currentPageIndex =
                          context.read<ElmPreCubit>().currentPageIndex;
                      context
                          .read<ElmPreCubit>()
                          .customShareContent(currentPageIndex, elmListPreNew);
                    },
                    icon: const Icon(Icons.share),
                  ),
                  const Text(
                    "  المقدمة  ",
                    style: TextStyle(
                      color: AppColor.primaryColorGolden,
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  //   context.read<ElmPreCubit>().resetCounter();
                  // Ensure resetCounter is invoked
                  Navigator.pushNamed(context, RoutesConstant.home);
                },
                child: const Icon(Icons.arrow_back),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<ElmPreCubit>().decreaseFontSize();
                  },
                  icon: const Icon(Icons.remove),
                ),
                const Center(
                  child: Text(
                    "الخط",
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<ElmPreCubit>().increaseFontSize();
                  },
                  icon: const Icon(Icons.add),
                )
              ],
            ),
            body: const SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: CustomTextSliderElmPre(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
