import 'package:hive/hive.dart';

class HistoryRepository {
  HistoryRepository(this._box);
  final Box<dynamic> _box;

  Future<void> record({required String action, String? fileId, String? details}) async {
    final id = '${DateTime.now().microsecondsSinceEpoch}-${_box.length}';
    await _box.put(id, {
      'id': id,
      'action': action,
      'fileId': fileId,
      'details': details,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  List<Map<String, dynamic>> getAll() => _box.values
      .map((value) => Map<String, dynamic>.from(value as Map))
      .toList(growable: false)
      .reversed
      .toList(growable: false);

  Future<void> clear() => _box.clear();
}
