import 'package:elm/core/data/model/elm_lists/elm_list_10_new_order.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_11_new_order.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_12_new_order.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_13_new_order.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_14_new_order.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_15_new_order.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_16_new_order.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_17_new_order.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_18_new_order.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_19_new_order.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_1_new_order.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_20_new_order.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_21_new_order.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_22_new_order.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_23_new_order.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_2_new_order.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_3_new_order.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_4_new_order.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_5_new_order.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_6_new_order.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_7_new_order.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_8_new_order.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_9_new_order.dart';
import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';
import 'package:elm/helpers/search/remove_search_diacritics.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  final List<ElmModelNewOrder> elmList = [
    ...elmList1NewOrder,
    ...elmList2NewOrder,
    ...elmList3NewOrder,
    ...elmList4NewOrder,
    ...elmList5NewOrder,
    ...elmList6NewOrder,
    ...elmList7NewOrder,
    ...elmList8NewOrder,
    ...elmList9NewOrder,
    ...elmList10NewOrder,
    ...elmList11NewOrder,
    ...elmList12NewOrder,
    ...elmList13NewOrder,
    ...elmList14NewOrder,
    ...elmList15NewOrder,
    ...elmList16NewOrder,
    ...elmList17NewOrder,
    ...elmList18NewOrder,
    ...elmList19NewOrder,
    ...elmList20NewOrder,
    ...elmList21NewOrder,
    ...elmList22NewOrder,
    ...elmList23NewOrder,
  ];

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
    final searchResults = <Widget>[];

    for (var elm in elmList) {
      for (var orderItem in elm.order) {
        List<String>? contentList;
        switch (orderItem) {
          case EnOrder.titles:
            contentList = elm.titles;
            break;
          case EnOrder.subtitles:
            contentList = elm.subtitles;
            break;
          case EnOrder.texts:
            contentList = elm.texts;
            break;
          case EnOrder.ayahs:
            contentList = elm.ayahs;
            break;
          case EnOrder.footer:
            contentList = elm.footer != null ? [elm.footer!] : null;
            break;
        }

        if (contentList != null) {
          for (var content in contentList) {
            // إزالة التشكيل من النصوص و query قبل المقارنة

            if (removeSearchDiacritics(content)
                .contains(removeSearchDiacritics(query))) {
              searchResults.add(
                ListTile(
                  title: Text(content),
                  onTap: () {
                    // يمكن إضافة التنقل للصفحة المطلوبة هنا
                  },
                ),
              );
            }
          }
        }
      }
    }

    return searchResults.isNotEmpty
        ? ListView(children: searchResults)
        : const Center(child: Text("لم يتم العثور على نتائج"));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text("ابحث عن المحتوى المطلوب"));
  }
}
