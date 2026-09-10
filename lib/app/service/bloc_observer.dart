import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      debugPrint('[BLoC] ${bloc.runtimeType}: $error');
    }
    super.onError(bloc, error, stackTrace);
  }
}
