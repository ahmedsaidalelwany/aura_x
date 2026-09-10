import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app/routes/route_names.dart';

class MainLayoutPage extends StatelessWidget {
  const MainLayoutPage({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Row(
      children: [
        NavigationRail(
          selectedIndex: 0,
          onDestinationSelected: (index) {
            const routes = [
              RouteNames.home,
              RouteNames.files,
              RouteNames.recent,
              RouteNames.favorites,
              RouteNames.trash,
              RouteNames.history,
              RouteNames.settings,
            ];
            if (index < routes.length) context.go(routes[index]);
          },
          destinations: const [
            NavigationRailDestination(icon: Icon(Icons.home_outlined), label: Text('Home')),
            NavigationRailDestination(icon: Icon(Icons.folder_outlined), label: Text('Files')),
            NavigationRailDestination(icon: Icon(Icons.history), label: Text('Recent')),
            NavigationRailDestination(icon: Icon(Icons.star_border), label: Text('Favorites')),
            NavigationRailDestination(icon: Icon(Icons.delete_outline), label: Text('Trash')),
            NavigationRailDestination(icon: Icon(Icons.manage_history), label: Text('History')),
            NavigationRailDestination(icon: Icon(Icons.settings_outlined), label: Text('Settings')),
          ],
        ),
        Expanded(child: child),
      ],
    ),
  );
}
