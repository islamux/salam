import 'package:elm/core/data/model/elm_lists/elm_list_31_new_order.dart';
import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/cubit/elm_cubits/elm_31_cubit.dart';
import 'package:elm/helpers/extensions/navigation_helper.dart';
import 'package:elm/view/widget/custom_text_slider/generic_custom_text_slider.dart';
import 'package:elm/core/data/static/imagelink/image_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Elm31Page extends StatelessWidget {
  final int? initialPage;

  const Elm31Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = Elm31Cubit();
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
                          context.read<Elm31Cubit>().currentPageIndex;
                      context.read<Elm31Cubit>().customShareContent(
                          currentPageIndex, elmList31NewOrder);
                    },
                    icon: const Icon(Icons.share),
                  ),
                  const Text(
                    "الخاطرة 31",
                  ),
                ],
              ),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  context.read<Elm31Cubit>().resetCounter();
                  context.pushNamed(RoutesConstant.home);
                },
                child: const Icon(Icons.arrow_back),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<Elm31Cubit>().decreaseFontSize();
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
                    context.read<Elm31Cubit>().increaseFontSize();
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
                      cubit: context.read<Elm31Cubit>(),
                      dataList: elmList31NewOrder,
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
