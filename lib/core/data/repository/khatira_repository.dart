import 'package:khatir/core/data/model/khatira_model_new_order.dart';

abstract class KhatiraRepository {
  Future<List<KhatiraModelNewOrder>> getAll();

  Future<KhatiraModelNewOrder?> getById(int id);

  Future<List<KhatiraModelNewOrder>> search(String query);
}
