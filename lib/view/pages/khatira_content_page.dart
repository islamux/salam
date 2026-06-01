import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khatir/core/data/model/khatira_model_new_order.dart';
import 'package:khatir/core/data/static/imagelink/image_link.dart';
import 'package:khatir/core/data/static/routes_constant.dart';
import 'package:khatir/core/data/static/theme/app_color_constant.dart';
import 'package:khatir/cubit/base_cubit/base_page_cubit.dart';
import 'package:khatir/helpers/extensions/navigation_helper.dart';
import 'package:khatir/helpers/search/data_search.dart';
import 'package:khatir/view/widget/custom_text_slider/generic_custom_text_slider.dart';

class KhatiraContentPage<C extends BasePageCubit> extends StatelessWidget{

  // Fun Create cubit (controller) & Recives BuildContext to read arguments if needed
  final C Function(BuildContext context) createCubit;

  // dataList
  final List<KhatiraModelNewOrder> dataList;

  // Title in AppBar 
  final String title;

  // TODO Fix Later make it as the all pages :
  // If true , title is styled with golden color(pre, final pages)
  final bool useGoldenTitle;

  // Optional initial page 
  final int? initialPage;

  // Background image path
  final String backgroundImagePath;

const KhatiraContentPage({
super.key,
required this.createCubit,
required this.dataList,
required this.title,
this.useGoldenTitle = false,
this.initialPage,
this.backgroundImagePath = ImageLink.image12
});

@override
Widget build(BuildContext context){
  return BlocProvider<C>(
  create: (context){
      final cubit = createCubit(context);
      if (initialPage != null && initialPage! > 0) {
        cubit.goToPageAfterBuild(initialPage!);
      }
      return cubit;
    },
    child: Builder(
    builder: (context){
    final cubit = context.read<C>();
    return Scaffold(
    appBar: AppBar(
    backgroundColor: AppColor.black,
    foregroundColor: AppColor.amber,
    title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    IconButton(onPressed: (){
    final currentPageIndex = cubit.currentPageIndex;
    cubit.customShareContent(currentPageIndex, dataList);
    },
    icon: const Icon(Icons.share),),

useGoldenTitle ? Text(title, style: const TextStyle(color: AppColor.primaryColorGolden)) : Text(title),
    ],),
    centerTitle: true,
    leading: GestureDetector(  
    onTap: (){
    cubit.resetCounter();
    context.pushNamed(RoutesConstant.home);
    },
child: const Icon(Icons.arrow_back),
    ),
    actions: [
    IconButton(onPressed: ()=> cubit.decreaseFontSize(), icon: Icon(Icons.remove),),
    const Row( 
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text("الخط")
    ],),
    IconButton(onPressed: ()=> cubit.increaseFontSize(), icon: const Icon(Icons.add),),
    IconButton(onPressed: (){
        showSearch(context: context, delegate: DataSearch());
    },
    icon: const Icon(Icons.search),),
    ],
    ),

    body: SafeArea(child: 
    Column(children: [
    Expanded(child: GenericCustomTextSlider(
    cubit: cubit,
    dataList: dataList,
    backgroundImagePath: backgroundImagePath,
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
