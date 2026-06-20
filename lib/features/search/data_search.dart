import 'package:khatir/features/khatira/data/lists/khatira_list_10_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_11_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_12_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_13_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_14_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_15_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_16_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_17_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_18_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_19_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_1_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_20_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_21_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_22_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_23_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_24_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_25_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_26_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_27_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_28_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_29_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_2_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_30_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_31_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_3_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_4_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_5_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_6_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_7_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_8_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_9_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_final_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_pre_order.dart';
import 'package:khatir/core/data/model/khatira_model_order.dart';
import 'package:khatir/core/data/model/enum_order.dart';
import 'package:khatir/core/routing/routes_constant.dart';
import 'package:khatir/core/data/static/strings/app_strings.dart';
import 'package:khatir/features/search/remove_search_diacritics.dart';
import 'package:khatir/features/search/search_result.dart';
import 'package:flutter/material.dart';

class _ListConfig {
  final List<KhatiraModelOrder> list;
  final String listName;
  final String routeName;

  _ListConfig(this.list, this.listName, this.routeName);
}

class DataSearch extends SearchDelegate {
  List<SearchResult> _buildResultsWithPage() {
    final results = <SearchResult>[];
    final listConfigs = <_ListConfig>[
      _ListConfig(
          khatiraListPreOrder, AppStrings.lessonPre, RoutesConstant.khatiraPre),
      _ListConfig(
          khatiraList1Order, AppStrings.lesson1, RoutesConstant.khatira1),
      _ListConfig(
          khatiraList2Order, AppStrings.lesson2, RoutesConstant.khatira2),
      _ListConfig(
          khatiraList3Order, AppStrings.lesson3, RoutesConstant.khatira3),
      _ListConfig(
          khatiraList4Order, AppStrings.lesson4, RoutesConstant.khatira4),
      _ListConfig(
          khatiraList5Order, AppStrings.lesson5, RoutesConstant.khatira5),
      _ListConfig(
          khatiraList6Order, AppStrings.lesson6, RoutesConstant.khatira6),
      _ListConfig(
          khatiraList7Order, AppStrings.lesson7, RoutesConstant.khatira7),
      _ListConfig(
          khatiraList8Order, AppStrings.lesson8, RoutesConstant.khatira8),
      _ListConfig(
          khatiraList9Order, AppStrings.lesson9, RoutesConstant.khatira9),
      _ListConfig(
          khatiraList10Order, AppStrings.lesson10, RoutesConstant.khatira10),
      _ListConfig(
          khatiraList11Order, AppStrings.lesson11, RoutesConstant.khatira11),
      _ListConfig(
          khatiraList12Order, AppStrings.lesson12, RoutesConstant.khatira12),
      _ListConfig(
          khatiraList13Order, AppStrings.lesson13, RoutesConstant.khatira13),
      _ListConfig(
          khatiraList14Order, AppStrings.lesson14, RoutesConstant.khatira14),
      _ListConfig(
          khatiraList15Order, AppStrings.lesson15, RoutesConstant.khatira15),
      _ListConfig(
          khatiraList16Order, AppStrings.lesson16, RoutesConstant.khatira16),
      _ListConfig(
          khatiraList17Order, AppStrings.lesson17, RoutesConstant.khatira17),
      _ListConfig(
          khatiraList18Order, AppStrings.lesson18, RoutesConstant.khatira18),
      _ListConfig(
          khatiraList19Order, AppStrings.lesson19, RoutesConstant.khatira19),
      _ListConfig(
          khatiraList20Order, AppStrings.lesson20, RoutesConstant.khatira20),
      _ListConfig(
          khatiraList21Order, AppStrings.lesson21, RoutesConstant.khatira21),
      _ListConfig(
          khatiraList22Order, AppStrings.lesson22, RoutesConstant.khatira22),
      _ListConfig(
          khatiraList23Order, AppStrings.lesson23, RoutesConstant.khatira23),
      _ListConfig(
          khatiraList24Order, AppStrings.lesson24, RoutesConstant.khatira24),
      _ListConfig(
          khatiraList25Order, AppStrings.lesson25, RoutesConstant.khatira25),
      _ListConfig(
          khatiraList26Order, AppStrings.lesson26, RoutesConstant.khatira26),
      _ListConfig(
          khatiraList27Order, AppStrings.lesson27, RoutesConstant.khatira27),
      _ListConfig(
          khatiraList28Order, AppStrings.lesson28, RoutesConstant.khatira28),
      _ListConfig(
          khatiraList29Order, AppStrings.lesson29, RoutesConstant.khatira29),
      _ListConfig(
          khatiraList30Order, AppStrings.lesson30, RoutesConstant.khatira30),
      _ListConfig(
          khatiraList31Order, AppStrings.lesson31, RoutesConstant.khatira31),
      _ListConfig(khatiraListFinalOrder, AppStrings.lessonFinal,
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
              fieldName = AppStrings.fieldTitle;
              break;
            case EnOrder.subtitles:
              contentList = khatiraModel.subtitles;
              fieldName = AppStrings.fieldSubtitle;
              break;
            case EnOrder.texts:
              contentList = khatiraModel.texts;
              fieldName = AppStrings.fieldText;
              break;
            case EnOrder.ayahs:
              contentList = khatiraModel.ayahs;
              fieldName = AppStrings.fieldAyah;
              break;
            case EnOrder.footer:
              contentList =
                  khatiraModel.footer != null ? [khatiraModel.footer!] : null;
              fieldName = AppStrings.fieldFooter;
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
  String get searchFieldLabel => AppStrings.searchFieldLabel;

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
      return const Center(child: Text(AppStrings.searchNoResultsFound));
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
    return const Center(child: Text(AppStrings.searchPrompt));
  }
}
