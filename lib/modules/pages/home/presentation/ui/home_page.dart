import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) => const _Page(title: 'Home', icon: Icons.home_outlined);
}

class _Page extends StatelessWidget {
  final String title;
  final IconData icon;
  const _Page({required this.title, required this.icon});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title)),
    body: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [Icon(icon, size: 48), const SizedBox(height: 12), Text(title, style: Theme.of(context).textTheme.headlineSmall)])),
  );
}
