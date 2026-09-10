import 'dart:typed_data';

typedef ViewerBuilder = Object Function(Uint8List bytes, String fileName);

class ViewerRegistry {
  final Map<String, ViewerBuilder> _builders = {};
  void register(Iterable<String> mimeTypes, ViewerBuilder builder) {
    for (final type in mimeTypes) _builders[type] = builder;
  }
  ViewerBuilder? resolve(String mimeType) => _builders[mimeType];
}
