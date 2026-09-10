import 'package:get_it/get_it.dart';

import '../../core/lang/manager/lang_cubit.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  if (!getIt.isRegistered<LangCubit>()) {
    getIt.registerFactory<LangCubit>(LangCubit.new);
  }
}
