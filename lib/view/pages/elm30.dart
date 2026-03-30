import 'package:elm/core/data/model/elm_lists/elm_list_30_new_order.dart';
import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/cubit/elm_cubits/elm_30_cubit.dart';
import 'package:elm/helpers/extensions/navigation_helper.dart';
import 'package:elm/view/widget/custom_text_slider/generic_custom_text_slider.dart';
import 'package:elm/core/data/static/imagelink/image_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Elm30Page extends StatelessWidget {
  final int? initialPage;

  const Elm30Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = Elm30Cubit();
        if (initialPage != null && initialPage! > 0) {
          cubit.goToPage(initialPage!);
        }
        return cubit;
      },
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
                          context.read<Elm30Cubit>().currentPageIndex;
                      context.read<Elm30Cubit>().customShareContent(
                          currentPageIndex, elmList30NewOrder);
                    },
                    icon: const Icon(Icons.share),
                  ),
                  const Text(
                    "الخاطرة 30",
                  ),
                ],
              ),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  context.read<Elm30Cubit>().resetCounter();
                  context.pushNamed(RoutesConstant.home);
                },
                child: const Icon(Icons.arrow_back),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<Elm30Cubit>().decreaseFontSize();
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
                    context.read<Elm30Cubit>().increaseFontSize();
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
                      cubit: context.read<Elm30Cubit>(),
                      dataList: elmList30NewOrder,
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
