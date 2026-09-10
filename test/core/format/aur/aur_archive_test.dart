import 'dart:convert';

import 'package:aura_x/core/format/aur/aur_archive.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('creates an Aura-X manifest with the supported format version', () {
    final manifest = const AurArchive().manifest();

    expect(manifest['format'], '.aur');
    expect(manifest['version'], '1.2.3');
    expect(jsonDecode(utf8.decode(const AurArchive().manifestBytes()))['version'], '1.2.3');
  });

  test('round-trips archive entries', () {
    final archive = const AurArchive();
    final bytes = archive.encode({'hello.txt': utf8.encode('Aura-X')});
    final decoded = archive.decode(bytes);

    expect(utf8.decode(decoded['hello.txt']!), 'Aura-X');
  });
}
