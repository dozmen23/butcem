import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/transaction_repo.dart';
import '../../data/models/transaction_model.dart';
import 'package:intl/intl.dart';

class TransactionsPage extends ConsumerWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncList = ref.watch(transactionsStreamProvider);
    final f = NumberFormat.currency(locale: 'tr_TR', symbol: '₺');

    return asyncList.when(
      data: (items) {
        if (items.isEmpty) {
          return const Center(child: Text('Henüz işlem yok'));
        }
        return ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: items.length,
          separatorBuilder: (_, __) => const SizedBox(height: 6),
          itemBuilder: (context, i) {
            final tx = items[i];
            final amount = tx.amountCents / 100.0;
            return ListTile(
              leading: Icon(tx.isIncome ? Icons.arrow_downward : Icons.arrow_upward),
              title: Text('${tx.category} • ${tx.wallet}'),
              subtitle: Text(DateFormat('d MMM yyyy HH:mm', 'tr_TR').format(tx.createdAt)),
              trailing: Text(
                f.format(amount),
                style: TextStyle(
                  color: tx.isIncome ? Colors.green : Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('Hata: $e')),
    );
  }
}
