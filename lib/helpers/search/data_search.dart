import 'package:khatir/core/data/model/khatira_lists/khatira_list_10_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_11_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_12_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_13_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_14_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_15_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_16_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_17_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_18_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_19_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_1_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_20_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_21_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_22_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_23_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_24_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_25_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_26_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_27_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_28_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_29_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_2_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_30_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_31_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_3_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_4_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_5_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_6_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_7_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_8_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_9_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_final_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_pre_new_order.dart';
import 'package:khatir/core/data/model/khatira_model_new_order.dart';
import 'package:khatir/core/data/model/enum_order.dart';
import 'package:khatir/core/data/static/routes_constant.dart';
import 'package:khatir/helpers/search/remove_search_diacritics.dart';
import 'package:khatir/helpers/search/search_result.dart';
import 'package:flutter/material.dart';

class _ListConfig {
  final List<KhatiraModelNewOrder> list;
  final String listName;
  final String routeName;

  _ListConfig(this.list, this.listName, this.routeName);
}

class DataSearch extends SearchDelegate {
  List<SearchResult> _buildResultsWithPage() {
    final results = <SearchResult>[];
    final listConfigs = <_ListConfig>[
      _ListConfig(
          khatiraListPreNewOrder, 'الدرس التمهيدي', RoutesConstant.khatiraPre),
      _ListConfig(khatiraList1NewOrder, 'الدرس الأول', RoutesConstant.khatira1),
      _ListConfig(
          khatiraList2NewOrder, 'الدرس الثاني', RoutesConstant.khatira2),
      _ListConfig(
          khatiraList3NewOrder, 'الدرس الثالث', RoutesConstant.khatira3),
      _ListConfig(
          khatiraList4NewOrder, 'الدرس الرابع', RoutesConstant.khatira4),
      _ListConfig(
          khatiraList5NewOrder, 'الدرس الخامس', RoutesConstant.khatira5),
      _ListConfig(
          khatiraList6NewOrder, 'الدرس السادس', RoutesConstant.khatira6),
      _ListConfig(
          khatiraList7NewOrder, 'الدرس السابع', RoutesConstant.khatira7),
      _ListConfig(
          khatiraList8NewOrder, 'الدرس الثامن', RoutesConstant.khatira8),
      _ListConfig(
          khatiraList9NewOrder, 'الدرس التاسع', RoutesConstant.khatira9),
      _ListConfig(
          khatiraList10NewOrder, 'الدرس العاشر', RoutesConstant.khatira10),
      _ListConfig(
          khatiraList11NewOrder, 'الدرس الحادي عشر', RoutesConstant.khatira11),
      _ListConfig(
          khatiraList12NewOrder, 'الدرس الثاني عشر', RoutesConstant.khatira12),
      _ListConfig(
          khatiraList13NewOrder, 'الدرس الثالث عشر', RoutesConstant.khatira13),
      _ListConfig(
          khatiraList14NewOrder, 'الدرس الرابع عشر', RoutesConstant.khatira14),
      _ListConfig(
          khatiraList15NewOrder, 'الدرس الخامس عشر', RoutesConstant.khatira15),
      _ListConfig(
          khatiraList16NewOrder, 'الدرس السادس عشر', RoutesConstant.khatira16),
      _ListConfig(
          khatiraList17NewOrder, 'الدرس السابع عشر', RoutesConstant.khatira17),
      _ListConfig(
          khatiraList18NewOrder, 'الدرس الثامن عشر', RoutesConstant.khatira18),
      _ListConfig(
          khatiraList19NewOrder, 'الدرس التاسع عشر', RoutesConstant.khatira19),
      _ListConfig(
          khatiraList20NewOrder, 'الدرس العشرون', RoutesConstant.khatira20),
      _ListConfig(khatiraList21NewOrder, 'الدرس الحادي والعشرون',
          RoutesConstant.khatira21),
      _ListConfig(khatiraList22NewOrder, 'الدرس الثاني والعشرون',
          RoutesConstant.khatira22),
      _ListConfig(khatiraList23NewOrder, 'الدرس الثالث والعشرون',
          RoutesConstant.khatira23),
      _ListConfig(khatiraList24NewOrder, 'الدرس الرابع والعشرون',
          RoutesConstant.khatira24),
      _ListConfig(khatiraList25NewOrder, 'الدرس الخامس والعشرون',
          RoutesConstant.khatira25),
      _ListConfig(khatiraList26NewOrder, 'الدرس السادس والعشرون',
          RoutesConstant.khatira26),
      _ListConfig(khatiraList27NewOrder, 'الدرس السابع والعشرون',
          RoutesConstant.khatira27),
      _ListConfig(khatiraList28NewOrder, 'الدرس الثامن والعشرون',
          RoutesConstant.khatira28),
      _ListConfig(khatiraList29NewOrder, 'الدرس التاسع والعشرون',
          RoutesConstant.khatira29),
      _ListConfig(
          khatiraList30NewOrder, 'الدرس الثلاثون', RoutesConstant.khatira30),
      _ListConfig(khatiraList31NewOrder, 'الدرس الحادي والثلاثون',
          RoutesConstant.khatira31),
      _ListConfig(khatiraListFinalNewOrder, 'الدرس الأخير',
          RoutesConstant.khatiraFinal),
    ];

    for (var config in listConfigs) {
      for (int pageIndex = 0; pageIndex < config.list.length; pageIndex++) {
        final khatiraModel = config.list[pageIndex];
        for (var orderItem in khatiraModel.order) {
          List<String>? contentList;
          String fieldName = '';

          switch (orderItem) {
            case EnOrder.titles:
              contentList = khatiraModel.titles;
              fieldName = 'العنوان';
              break;
            case EnOrder.subtitles:
              contentList = khatiraModel.subtitles;
              fieldName = 'العنوان الفرعي';
              break;
            case EnOrder.texts:
              contentList = khatiraModel.texts;
              fieldName = 'النص';
              break;
            case EnOrder.ayahs:
              contentList = khatiraModel.ayahs;
              fieldName = 'الآية';
              break;
            case EnOrder.footer:
              contentList =
                  khatiraModel.footer != null ? [khatiraModel.footer!] : null;
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
