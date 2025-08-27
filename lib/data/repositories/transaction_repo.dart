import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../isar_service.dart';
import '../models/transaction_model.dart';

/// DI: IsarService sağlayıcısı
final isarServiceProvider = Provider<IsarService>((ref) {
  throw UnimplementedError('IsarService henüz override edilmedi.');
});

/// Liste akışı
final transactionsStreamProvider =
    StreamProvider.autoDispose<List<TransactionModel>>((ref) {
  final db = ref.watch(isarServiceProvider);
  return db.watchTransactionsDesc();
});

/// Ekleme için kolaylaştırıcı
final addTransactionProvider =
    Provider<Future<void> Function(TransactionModel)>((ref) {
  final db = ref.watch(isarServiceProvider);
  return (tx) => db.addTransaction(tx);
});
