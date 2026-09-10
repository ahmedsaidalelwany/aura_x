import 'dart:convert';

import 'package:archive/archive.dart';

import '../../constants/app_constants.dart';


class AurArchive {
  const AurArchive();

  List<int> encode(Map<String, List<int>> files) {
    final archive = Archive();
    for (final entry in files.entries) {
      archive.addFile(ArchiveFile(entry.key, entry.value.length, entry.value));
    }
    return ZipEncoder().encode(archive);
  }

  Map<String, List<int>> decode(List<int> bytes) {
    final archive = ZipDecoder().decodeBytes(bytes);
    return {
      for (final file in archive.files)
        file.name: ?file.readBytes(),
    };
  }

  Map<String, dynamic> manifest() => {
    'format': AppConstants.fileExtension,
    'version': AppConstants.formatVersion,
    'encoding': 'zip',
    'manifestVersion': 1,
  };

  List<int> manifestBytes() => utf8.encode(jsonEncode(manifest()));
}
