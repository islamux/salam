import 'package:khatir/core/data/model/khatira_model_order.dart';

abstract class KhatiraRepository {
  Future<List<KhatiraModelOrder>> getAll();

  Future<KhatiraModelOrder?> getById(int id);

  Future<List<KhatiraModelOrder>> getChapter(int chapterId);

  Future<List<KhatiraModelOrder>> search(String query);
}
