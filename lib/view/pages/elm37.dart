import 'package:elm/core/data/model/elm_lists/elm_list_37_new_order.dart';
import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/cubit/elm_cubits/elm_37_cubit.dart';
import 'package:elm/helpers/extensions/navigation_helper.dart';
import 'package:elm/view/widget/custom_text_slider/generic_custom_text_slider.dart';
import 'package:elm/core/data/static/imagelink/image_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Elm37Page extends StatelessWidget {
  const Elm37Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Elm37Cubit(),
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
                          context.read<Elm37Cubit>().currentPageIndex;
                      context.read<Elm37Cubit>().customShareContent(
                          currentPageIndex, elmList37NewOrder);
                    },
                    icon: const Icon(Icons.share),
                  ),
                  const Text(
                    "الخاطرة 37",
                  ),
                ],
              ),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  context.read<Elm37Cubit>().resetCounter();
                  context.pushNamed(RoutesConstant.home);
                },
                child: const Icon(Icons.arrow_back),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<Elm37Cubit>().decreaseFontSize();
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
                    context.read<Elm37Cubit>().increaseFontSize();
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
                      cubit: context.read<Elm37Cubit>(),
                      dataList: elmList37NewOrder,
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
