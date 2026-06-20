import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khatir/core/data/model/khatira_model_order.dart';
import 'package:khatir/core/cubit/base_page_cubit.dart';
import 'package:khatir/core/cubit/base_page_state.dart';
import 'package:khatir/core/widgets/custom_text_slider/get_page_texts_order.dart';
import 'package:khatir/core/theme/app_color_constant.dart';

class GenericCustomTextSlider extends StatefulWidget {
  final BasePageCubit cubit;
  final List<KhatiraModelOrder> dataList;
  final String backgroundImagePath;
  final int? initialPage;

  const GenericCustomTextSlider({
    super.key,
    required this.cubit,
    required this.dataList,
    required this.backgroundImagePath,
    this.initialPage,
  });

  @override
  State<GenericCustomTextSlider> createState() =>
      _GenericCustomTextSliderState();
}

class _GenericCustomTextSliderState extends State<GenericCustomTextSlider> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    if (widget.initialPage != null && widget.initialPage! > 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _pageController.jumpToPage(widget.initialPage!);
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasePageCubit, BasePageState>(
      bloc: widget.cubit,
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.backgroundImagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: PageView.builder(
                reverse: true,
                controller: _pageController,
                onPageChanged: (index) => widget.cubit.onPageChanged(index),
                itemCount: widget.dataList.length,
                itemBuilder: (BuildContext context, int i) {
                  return Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 60, left: 32, right: 32, bottom: 60),
                          child: SingleChildScrollView(
                            child: RichText(
                              textAlign: TextAlign.right,
                              text: TextSpan(
                                children: getPageTexts(i, widget.dataList),
                                style: TextStyle(
                                  fontFamily: "Amiri",
                                  fontSize: widget.cubit.fontSize,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Slider(
                    value: widget.cubit.currentPageIndex.toDouble(),
                    onChanged: (double value) =>
                        _pageController.jumpToPage(value.toInt()),
                    min: 0,
                    max: widget.dataList.isEmpty
                        ? 0
                        : widget.dataList.length.toDouble() - 1,
                    activeColor: AppColor.black,
                    inactiveColor: AppColor.grey,
                  ),
                  Text(
                    '${widget.cubit.currentPageIndex + 1} / ${widget.dataList.length}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
