import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../core/lang/app_localizations.dart';
import '../../core/lang/manager/lang_cubit.dart';
import '../../core/lang/manager/lang_state.dart';
import '../../core/theme/app_theme.dart';
import '../di/injection.dart';
import '../routes/route_manager.dart';

class AuraXApp extends StatelessWidget {
  const AuraXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LangCubit>()..loadLanguage(),
      child: BlocBuilder<LangCubit, LangState>(
        builder: (context, state) {
          final locale = state is LangLoaded
              ? state.locale
              : AppLocalization.fallbackLocale;
          return ScreenUtilInit(
            designSize: const Size(390, 844),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) => MaterialApp.router(
              debugShowCheckedModeBanner: false,
              locale: locale,
              supportedLocales: AppLocalization.supportedLocales,
              theme: AppTheme.light(),
              darkTheme: AppTheme.dark(),
              themeMode: ThemeMode.system,
              routerConfig: AppRouteManager.router,
              builder: (context, child) => ResponsiveBreakpoints.builder(
                child: child ?? const SizedBox.shrink(),
                breakpoints: const [
                  Breakpoint(start: 0, end: 599, name: MOBILE),
                  Breakpoint(start: 600, end: 1023, name: TABLET),
                  Breakpoint(start: 1024, end: double.infinity, name: DESKTOP),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
