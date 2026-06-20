import 'package:khatir/features/khatira/data/lists/khatira_list_1_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_2_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_3_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_4_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_5_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_6_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_7_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_8_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_9_order.dart';
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
import 'package:khatir/features/khatira/data/lists/khatira_list_30_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_31_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_32_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_final_order.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_pre_order.dart';
import 'package:khatir/core/data/model/khatira_model_order.dart';
import 'package:khatir/core/data/repository/khatira_repository.dart';

class StaticKhatiraRepository implements KhatiraRepository {
  static final List<List<KhatiraModelOrder>> _chapters = [
    khatiraListPreOrder,
    khatiraList1Order,
    khatiraList2Order,
    khatiraList3Order,
    khatiraList4Order,
    khatiraList5Order,
    khatiraList6Order,
    khatiraList7Order,
    khatiraList8Order,
    khatiraList9Order,
    khatiraList10Order,
    khatiraList11Order,
    khatiraList12Order,
    khatiraList13Order,
    khatiraList14Order,
    khatiraList15Order,
    khatiraList16Order,
    khatiraList17Order,
    khatiraList18Order,
    khatiraList19Order,
    khatiraList20Order,
    khatiraList21Order,
    khatiraList22Order,
    khatiraList23Order,
    khatiraList24Order,
    khatiraList25Order,
    khatiraList26Order,
    khatiraList27Order,
    khatiraList28Order,
    khatiraList29Order,
    khatiraList30Order,
    khatiraList31Order,
    khatiraList32Order,
    khatiraListFinalOrder,
  ];

  @override
  Future<List<KhatiraModelOrder>> getAll() async =>
      _chapters.expand((c) => c).toList();

  @override
  Future<KhatiraModelOrder?> getById(int id) async {
    if (id < 0 || id >= _chapters.length) return null;
    return _chapters[id].first;
  }

  @override
  Future<List<KhatiraModelOrder>> getChapter(int chapterId) async {
    if (chapterId < 0 || chapterId >= _chapters.length) return [];
    return _chapters[chapterId];
  }

  @override
  Future<List<KhatiraModelOrder>> search(String query) async {
    final all = await getAll();
    return all.where((item) {
      final containsInTitles =
          item.titles?.any((t) => t.contains(query)) ?? false;
      final containsInSubtitles =
          item.subtitles?.any((s) => s.contains(query)) ?? false;
      final containsInTexts =
          item.texts?.any((t) => t.contains(query)) ?? false;
      final containsInAyahs =
          item.ayahs?.any((a) => a.contains(query)) ?? false;
      final containsInFooter = item.footer?.contains(query) ?? false;
      return containsInTitles ||
          containsInSubtitles ||
          containsInTexts ||
          containsInAyahs ||
          containsInFooter;
    }).toList();
  }
}
