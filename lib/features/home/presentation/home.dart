import 'package:flutter/material.dart';

import 'package:khatir/core/data/static/imagelink/image_link.dart';
import 'package:khatir/core/routing/routes_constant.dart';
import 'package:khatir/core/data/static/strings/app_strings.dart';
import 'package:khatir/core/theme/app_color_constant.dart';
import 'package:khatir/core/services/navigation_helper.dart';
import 'package:khatir/core/services/handle_pop.dart';
import 'package:share_plus/share_plus.dart';
import 'package:khatir/features/search/data_search.dart';
import 'package:khatir/features/home/presentation/custom_drawer_listview.dart';

import 'package:khatir/core/widgets/custom_botton.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Widget btn(String text, String route) => CustomButton(
          customText: text,
          onPressed: () => context.pushNamed(route),
          icon: const Icon(Icons.menu_book),
        );

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPost, result) =>
          handlePop(context, didPost, result),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.black,
            foregroundColor: AppColor.amber,
            title: const Text(
              AppStrings.homeAppBarTitle,
              style: TextStyle(
                fontSize: 21,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                },
                icon: const Icon(Icons.search),
              ),
              TextButton(
                onPressed: () {
                  SharePlus.instance.share(ShareParams(
                    text: AppStrings.homeShareText,
                  ));
                },
                child: const Text(
                  AppStrings.homeShareButton,
                  style: TextStyle(
                    color: AppColor.primaryColorGolden,
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
          drawer: const Directionality(
            textDirection: TextDirection.rtl,
            child: Drawer(
              backgroundColor: AppColor.primaryColorGolden,
              child: CustomDrawerListView(),
            ),
          ),
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageLink.image5),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1,
                  right: MediaQuery.of(context).size.width * 0.3,
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.arrow_upward,
                      color: AppColor.primaryColorGolden,
                      size: 36,
                    ),
                    Text(
                      AppStrings.homeScrollHint,
                      style: TextStyle(
                        color: AppColor.primaryColorGolden,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 160, bottom: 130),
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        btn('خواطر متفرقة حول الدين والحياة',
                            RoutesConstant.khatiraPre),
                        btn(
                            '(1) عوامل تفكك وفشل الأسرة والقبيلة',
                            RoutesConstant.khatira1),
                        btn('(2) العلم والمعرفة',
                            RoutesConstant.khatira2),
                        btn(
                            '(3) العطاء ليس مقياس لحب الله للعبد',
                            RoutesConstant.khatira3),
                        btn(' (4) المحبة الإلهية',
                            RoutesConstant.khatira4),
                        btn('  (5)   العدل',
                            RoutesConstant.khatira5),
                        btn('  (6)   الشرك الخفي',
                            RoutesConstant.khatira6),
                        btn('  (7)   التوكل على الله',
                            RoutesConstant.khatira7),
                        btn(' (8)   المعية الإلهية',
                            RoutesConstant.khatira8),
                        btn('(9) فأما اليتيم فلا تقهر ',
                            RoutesConstant.khatira9),
                        btn(' (10) والذين جاهدو فينا',
                            RoutesConstant.khatira10),
                        btn(' (11)   الرزق',
                            RoutesConstant.khatira11),
                        btn('(12) وإنك لعلى خلق عظيم',
                            RoutesConstant.khatira12),
                        btn('(13) مأ أصابكم من مصيبة ',
                            RoutesConstant.khatira13),
                        btn('(14)  الإسلام دين شامل',
                            RoutesConstant.khatira14),
                        btn('(15) العزة لله  ',
                            RoutesConstant.khatira15),
                        btn('(16)  المرأة الصالحة  ',
                            RoutesConstant.khatira16),
                        btn(' (17)   الدعاء',
                            RoutesConstant.khatira17),
                        btn(' (18)   مقتطفات',
                            RoutesConstant.khatira18),
                        btn(' (19)   أولياء الله',
                            RoutesConstant.khatira19),
                        btn(' (20)   التقوى',
                            RoutesConstant.khatira20),
                        btn(' (21)  الصبر ',
                            RoutesConstant.khatira21),
                        btn(' (22)  الحمد ',
                            RoutesConstant.khatira22),
                        btn(' (23)  يدبر الأمر ',
                            RoutesConstant.khatira23),
                        btn('(24) شكر النعمة أمان من زوالها',
                            RoutesConstant.khatira24),
                        btn('(25) قد أفلح المؤمنون',
                            RoutesConstant.khatira25),
                        btn('(26) الكبــــــــر ',
                            RoutesConstant.khatira26),
                        btn(
                            '(27) الأمر بالمعروف والنهي عن المنكر ',
                            RoutesConstant.khatira27),
                        btn('(28) لا تخف إنك أنت الأعلى',
                            RoutesConstant.khatira28),
                        btn('(29) الطيران في الجنة',
                            RoutesConstant.khatira29),
                        btn('(30) ياليتني قدمت لحياتي',
                            RoutesConstant.khatira30),
                        btn('(31) يا بني اركب معنا',
                            RoutesConstant.khatira31),
                        btn(
                            '(32) الإحساس بالنذالة شيء لايطاق',
                            RoutesConstant.khatira32),
                        btn(' (خاتمة)  المصير المحتوم ',
                            RoutesConstant.khatiraFinal),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
