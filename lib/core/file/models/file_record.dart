import 'package:uuid/uuid.dart';

class FileRecord {
  FileRecord({String? id, required this.path, required this.name, required this.mimeType, required this.size, this.isFavorite = false, this.isDeleted = false, DateTime? createdAt, DateTime? updatedAt})
      : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  final String id;
  final String path;
  final String name;
  final String mimeType;
  final int size;
  final bool isFavorite;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  Map<String, dynamic> toMap() => {
    'id': id, 'path': path, 'name': name, 'mimeType': mimeType, 'size': size,
    'isFavorite': isFavorite, 'isDeleted': isDeleted,
    'createdAt': createdAt.toIso8601String(), 'updatedAt': updatedAt.toIso8601String(),
  };

  factory FileRecord.fromMap(Map<dynamic, dynamic> map) => FileRecord(
    id: map['id'] as String,
    path: map['path'] as String,
    name: map['name'] as String,
    mimeType: map['mimeType'] as String,
    size: map['size'] as int,
    isFavorite: map['isFavorite'] as bool? ?? false,
    isDeleted: map['isDeleted'] as bool? ?? false,
    createdAt: DateTime.parse(map['createdAt'] as String),
    updatedAt: DateTime.parse(map['updatedAt'] as String),
  );
}
