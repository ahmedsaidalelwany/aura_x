import 'package:flutter/material.dart';

class FilesPage extends StatelessWidget {
  const FilesPage({super.key});
  @override
  Widget build(BuildContext context) => const _SimplePage('Files', Icons.folder_outlined);
}
class _SimplePage extends StatelessWidget {
  final String title; final IconData icon;
  const _SimplePage(this.title, this.icon);
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text(title)), body: Center(child: Icon(icon, size: 56)));
}
