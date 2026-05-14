import 'package:khatir/core/data/model/elm_lists/elm_list_10_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_11_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_12_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_13_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_14_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_15_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_16_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_17_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_18_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_19_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_1_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_20_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_21_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_22_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_23_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_24_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_25_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_26_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_27_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_28_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_29_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_2_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_30_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_31_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_3_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_4_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_5_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_6_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_7_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_8_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_9_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_final_new_order.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_pre_new_order.dart';
import 'package:khatir/core/data/model/elm_model_new_order.dart';
import 'package:khatir/core/data/model/enum_order.dart';
import 'package:khatir/core/data/static/routes_constant.dart';
import 'package:khatir/helpers/search/remove_search_diacritics.dart';
import 'package:khatir/helpers/search/search_result.dart';
import 'package:flutter/material.dart';

class _ListConfig {
  final List<ElmModelNewOrder> list;
  final String listName;
  final String routeName;

  _ListConfig(this.list, this.listName, this.routeName);
}

class DataSearch extends SearchDelegate {
  List<SearchResult> _buildResultsWithPage() {
    final results = <SearchResult>[];
    final listConfigs = <_ListConfig>[
      _ListConfig(elmListPreNewOrder, 'الدرس التمهيدي', RoutesConstant.elmPre),
      _ListConfig(elmList1NewOrder, 'الدرس الأول', RoutesConstant.elm1),
      _ListConfig(elmList2NewOrder, 'الدرس الثاني', RoutesConstant.elm2),
      _ListConfig(elmList3NewOrder, 'الدرس الثالث', RoutesConstant.elm3),
      _ListConfig(elmList4NewOrder, 'الدرس الرابع', RoutesConstant.elm4),
      _ListConfig(elmList5NewOrder, 'الدرس الخامس', RoutesConstant.elm5),
      _ListConfig(elmList6NewOrder, 'الدرس السادس', RoutesConstant.elm6),
      _ListConfig(elmList7NewOrder, 'الدرس السابع', RoutesConstant.elm7),
      _ListConfig(elmList8NewOrder, 'الدرس الثامن', RoutesConstant.elm8),
      _ListConfig(elmList9NewOrder, 'الدرس التاسع', RoutesConstant.elm9),
      _ListConfig(elmList10NewOrder, 'الدرس العاشر', RoutesConstant.elm10),
      _ListConfig(elmList11NewOrder, 'الدرس الحادي عشر', RoutesConstant.elm11),
      _ListConfig(elmList12NewOrder, 'الدرس الثاني عشر', RoutesConstant.elm12),
      _ListConfig(elmList13NewOrder, 'الدرس الثالث عشر', RoutesConstant.elm13),
      _ListConfig(elmList14NewOrder, 'الدرس الرابع عشر', RoutesConstant.elm14),
      _ListConfig(elmList15NewOrder, 'الدرس الخامس عشر', RoutesConstant.elm15),
      _ListConfig(elmList16NewOrder, 'الدرس السادس عشر', RoutesConstant.elm16),
      _ListConfig(elmList17NewOrder, 'الدرس السابع عشر', RoutesConstant.elm17),
      _ListConfig(elmList18NewOrder, 'الدرس الثامن عشر', RoutesConstant.elm18),
      _ListConfig(elmList19NewOrder, 'الدرس التاسع عشر', RoutesConstant.elm19),
      _ListConfig(elmList20NewOrder, 'الدرس العشرون', RoutesConstant.elm20),
      _ListConfig(
          elmList21NewOrder, 'الدرس الحادي والعشرون', RoutesConstant.elm21),
      _ListConfig(
          elmList22NewOrder, 'الدرس الثاني والعشرون', RoutesConstant.elm22),
      _ListConfig(
          elmList23NewOrder, 'الدرس الثالث والعشرون', RoutesConstant.elm23),
      _ListConfig(
          elmList24NewOrder, 'الدرس الرابع والعشرون', RoutesConstant.elm24),
      _ListConfig(
          elmList25NewOrder, 'الدرس الخامس والعشرون', RoutesConstant.elm25),
      _ListConfig(
          elmList26NewOrder, 'الدرس السادس والعشرون', RoutesConstant.elm26),
      _ListConfig(
          elmList27NewOrder, 'الدرس السابع والعشرون', RoutesConstant.elm27),
      _ListConfig(
          elmList28NewOrder, 'الدرس الثامن والعشرون', RoutesConstant.elm28),
      _ListConfig(
          elmList29NewOrder, 'الدرس التاسع والعشرون', RoutesConstant.elm29),
      _ListConfig(elmList30NewOrder, 'الدرس الثلاثون', RoutesConstant.elm30),
      _ListConfig(
          elmList31NewOrder, 'الدرس الحادي والثلاثون', RoutesConstant.elm31),
      _ListConfig(finalListNewOrder, 'الدرس الأخير', RoutesConstant.elmFinal),
    ];

    for (var config in listConfigs) {
      for (int pageIndex = 0; pageIndex < config.list.length; pageIndex++) {
        final elm = config.list[pageIndex];
        for (var orderItem in elm.order) {
          List<String>? contentList;
          String fieldName = '';

          switch (orderItem) {
            case EnOrder.titles:
              contentList = elm.titles;
              fieldName = 'العنوان';
              break;
            case EnOrder.subtitles:
              contentList = elm.subtitles;
              fieldName = 'العنوان الفرعي';
              break;
            case EnOrder.texts:
              contentList = elm.texts;
              fieldName = 'النص';
              break;
            case EnOrder.ayahs:
              contentList = elm.ayahs;
              fieldName = 'الآية';
              break;
            case EnOrder.footer:
              contentList = elm.footer != null ? [elm.footer!] : null;
              fieldName = 'الهوامش';
              break;
          }

          if (contentList != null) {
            for (var content in contentList) {
              if (removeSearchDiacritics(content)
                  .contains(removeSearchDiacritics(query))) {
                results.add(SearchResult(
                  listName: config.listName,
                  pageIndex: pageIndex,
                  matchedText: content,
                  routeName: config.routeName,
                  fieldName: fieldName,
                ));
              }
            }
          }
        }
      }
    }

    return results;
  }

  @override
  String get searchFieldLabel => "ابحث";

  @override
  TextStyle get searchFieldStyle => const TextStyle(fontSize: 17);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = _buildResultsWithPage();

    if (results.isEmpty) {
      return const Center(child: Text("لم يتم العثور على نتائج"));
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final result = results[index];
        return ListTile(
          title: Text(
            result.matchedText,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            '${result.listName} - ${result.displayTitle} - ${result.fieldName}',
            style: const TextStyle(fontSize: 12),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            close(context, null);
            Navigator.pushNamed(
              context,
              result.routeName,
              arguments: result.pageIndex,
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text("ابحث عن المحتوى المطلوب"));
  }
}
