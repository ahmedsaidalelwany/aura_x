import 'package:hive/hive.dart';

import '../models/file_record.dart';

class FileRepository {
  FileRepository(this._box);
  final Box<dynamic> _box;

  Future<void> save(FileRecord file) => _box.put(file.id, file.toMap());

  List<FileRecord> getAll() => _box.values
      .map((value) => FileRecord.fromMap(Map<dynamic, dynamic>.from(value as Map)))
      .toList(growable: false);

  Future<void> softDelete(String id) async {
    final value = _box.get(id);
    if (value == null) return;
    final file = FileRecord.fromMap(Map<dynamic, dynamic>.from(value as Map));
    await _box.put(id, {...file.toMap(), 'isDeleted': true, 'updatedAt': DateTime.now().toIso8601String()});
  }

  Future<void> restore(String id) async {
    final value = _box.get(id);
    if (value == null) return;
    final file = FileRecord.fromMap(Map<dynamic, dynamic>.from(value as Map));
    await _box.put(id, {...file.toMap(), 'isDeleted': false, 'updatedAt': DateTime.now().toIso8601String()});
  }

  Future<void> permanentlyDelete(String id) => _box.delete(id);
}
