import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../modules/pages/about/presentation/ui/about_page.dart';
import '../../modules/pages/favorites/presentation/ui/favorites_page.dart';
import '../../modules/pages/files/presentation/ui/files_page.dart';
import '../../modules/pages/history/presentation/ui/history_page.dart';
import '../../modules/pages/home/presentation/ui/home_page.dart';
import '../../modules/pages/recent/presentation/ui/recent_page.dart';
import '../../modules/pages/settings/presentation/ui/settings_page.dart';
import '../../modules/pages/trash/presentation/ui/trash_page.dart';
import 'route_names.dart';

abstract final class AppRouteManager {
  static final router = GoRouter(
    initialLocation: RouteNames.home,
    routes: [
      GoRoute(path: RouteNames.home, builder: (_, __) => const HomePage()),
      GoRoute(path: RouteNames.files, builder: (_, __) => const FilesPage()),
      GoRoute(path: RouteNames.recent, builder: (_, __) => const RecentPage()),
      GoRoute(path: RouteNames.favorites, builder: (_, __) => const FavoritesPage()),
      GoRoute(path: RouteNames.trash, builder: (_, __) => const TrashPage()),
      GoRoute(path: RouteNames.history, builder: (_, __) => const HistoryPage()),
      GoRoute(path: RouteNames.settings, builder: (_, __) => const SettingsPage()),
      GoRoute(path: RouteNames.about, builder: (_, __) => const AboutPage()),
    ],
    errorBuilder: (_, state) => Scaffold(
      body: Center(child: Text('Route not found: ${state.uri}')),
    ),
  );
}
