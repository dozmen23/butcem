import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'data/isar_service.dart';
import 'data/repositories/transaction_repo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Isar’ı aç
  final isarService = IsarService.instance;
  await isarService.init();

  runApp(
    ProviderScope(
      overrides: [
        isarServiceProvider.overrideWithValue(isarService),
      ],
      child: const ButcemApp(),
    ),
  );
}
