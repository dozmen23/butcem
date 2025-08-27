import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ListTile(leading: Icon(Icons.palette), title: Text('Tema'), subtitle: Text('Sistem varsayılanı')),
        ListTile(leading: Icon(Icons.lock), title: Text('Güvenlik'), subtitle: Text('PIN/Biyometrik (yakında)')),
        ListTile(leading: Icon(Icons.backup), title: Text('Yedekleme'), subtitle: Text('CSV/Drive (yakında)')),
      ],
    );
  }
}
