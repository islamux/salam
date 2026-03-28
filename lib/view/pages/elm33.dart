import 'package:elm/core/data/model/elm_lists/elm_list_33_new_order.dart';
import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/cubit/elm_cubits/elm_33_cubit.dart';
import 'package:elm/helpers/extensions/navigation_helper.dart';
import 'package:elm/view/widget/custom_text_slider/generic_custom_text_slider.dart';
import 'package:elm/core/data/static/imagelink/image_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Elm33Page extends StatelessWidget {
  const Elm33Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Elm33Cubit(),
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
                    onPressed: () {
                      final currentPageIndex =
                          context.read<Elm33Cubit>().currentPageIndex;
                      context.read<Elm33Cubit>().customShareContent(
                          currentPageIndex, elmList33NewOrder);
                    },
                    icon: const Icon(Icons.share),
                  ),
                  const Text(
                    "الخاطرة 33",
                  ),
                ],
              ),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  context.read<Elm33Cubit>().resetCounter();
                  context.pushNamed(RoutesConstant.home);
                },
                child: const Icon(Icons.arrow_back),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<Elm33Cubit>().decreaseFontSize();
                  },
                  icon: const Icon(Icons.remove),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("الخط"),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    context.read<Elm33Cubit>().increaseFontSize();
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: GenericCustomTextSlider(
                      cubit: context.read<Elm33Cubit>(),
                      dataList: elmList33NewOrder,
                      backgroundImagePath: ImageLink.image12,
                    ),
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
