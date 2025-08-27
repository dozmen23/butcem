import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        _Card(title: 'Toplam Bakiye', value: '₺ 0'),
        SizedBox(height: 12),
        _Card(title: 'Bu Ay Harcama', value: '₺ 0'),
        SizedBox(height: 12),
        _Card(title: 'Bütçe Durumu', value: '%0'),
      ],
    );
  }
}

class _Card extends StatelessWidget {
  final String title;
  final String value;
  const _Card({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(title), Text(value, style: const TextStyle(fontWeight: FontWeight.w600))],
        ),
      ),
    );
  }
}
