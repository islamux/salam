import 'package:khatir/core/data/model/khatira_lists/khatira_list_1_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_2_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_3_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_4_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_5_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_6_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_7_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_8_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_9_new_order.dart';
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
import 'package:khatir/core/data/model/khatira_lists/khatira_list_30_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_31_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_32_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_final_new_order.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_pre_new_order.dart';
import 'package:khatir/core/data/model/khatira_model_new_order.dart';
import 'package:khatir/core/data/repository/khatira_repository.dart';

class StaticKhatiraRepository implements KhatiraRepository {
  static final List<List<KhatiraModelNewOrder>> _chapters = [
    khatiraListPreNewOrder,
    khatiraList1NewOrder,
    khatiraList2NewOrder,
    khatiraList3NewOrder,
    khatiraList4NewOrder,
    khatiraList5NewOrder,
    khatiraList6NewOrder,
    khatiraList7NewOrder,
    khatiraList8NewOrder,
    khatiraList9NewOrder,
    khatiraList10NewOrder,
    khatiraList11NewOrder,
    khatiraList12NewOrder,
    khatiraList13NewOrder,
    khatiraList14NewOrder,
    khatiraList15NewOrder,
    khatiraList16NewOrder,
    khatiraList17NewOrder,
    khatiraList18NewOrder,
    khatiraList19NewOrder,
    khatiraList20NewOrder,
    khatiraList21NewOrder,
    khatiraList22NewOrder,
    khatiraList23NewOrder,
    khatiraList24NewOrder,
    khatiraList25NewOrder,
    khatiraList26NewOrder,
    khatiraList27NewOrder,
    khatiraList28NewOrder,
    khatiraList29NewOrder,
    khatiraList30NewOrder,
    khatiraList31NewOrder,
    khatiraList32NewOrder,
    khatiraListFinalNewOrder,
  ];

  @override
  Future<List<KhatiraModelNewOrder>> getAll() async =>
      _chapters.expand((c) => c).toList();

  @override
  Future<KhatiraModelNewOrder?> getById(int id) async {
    if (id < 0 || id >= _chapters.length) return null;
    return _chapters[id].first;
  }

  @override
  Future<List<KhatiraModelNewOrder>> search(String query) async {
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
