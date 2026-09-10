import 'package:hive_flutter/hive_flutter.dart';

abstract final class HiveService {
  static Future<void> initialize() async {
    await Hive.initFlutter();
  }

  static Future<Box<dynamic>> openBox(String name) => Hive.openBox<dynamic>(name);
}
