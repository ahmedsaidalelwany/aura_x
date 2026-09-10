import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import 'app.dart';
import '../di/injection.dart';
import '../service/bloc_observer.dart';
import '../../core/storage/hive/hive_service.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await HiveService.initialize();
  configureDependencies();
  runApp(const AuraXApp());
}
