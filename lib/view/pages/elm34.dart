import 'package:elm/core/data/model/elm_lists/elm_list_34_new_order.dart';
import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/cubit/elm_cubits/elm_34_cubit.dart';
import 'package:elm/helpers/extensions/navigation_helper.dart';
import 'package:elm/view/widget/custom_text_slider/generic_custom_text_slider.dart';
import 'package:elm/core/data/static/imagelink/image_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Elm34Page extends StatelessWidget {
  const Elm34Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Elm34Cubit(),
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
                          context.read<Elm34Cubit>().currentPageIndex;
                      context.read<Elm34Cubit>().customShareContent(
                          currentPageIndex, elmList34NewOrder);
                    },
                    icon: const Icon(Icons.share),
                  ),
                  const Text(
                    "الخاطرة 34",
                  ),
                ],
              ),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  context.read<Elm34Cubit>().resetCounter();
                  context.pushNamed(RoutesConstant.home);
                },
                child: const Icon(Icons.arrow_back),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<Elm34Cubit>().decreaseFontSize();
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
                    context.read<Elm34Cubit>().increaseFontSize();
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
                      cubit: context.read<Elm34Cubit>(),
                      dataList: elmList34NewOrder,
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
