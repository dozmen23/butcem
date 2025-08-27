import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'models/transaction_model.dart';

class IsarService {
  static final IsarService instance = IsarService._();
  IsarService._();

  late Isar _isar;
  Isar get isar => _isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [TransactionModelSchema],
      directory: dir.path,
      inspector: false,
    );
  }

  Future<void> addTransaction(TransactionModel tx) async {
    await _isar.writeTxn(() async {
      await _isar.transactionModels.put(tx);
    });
  }

  Stream<List<TransactionModel>> watchTransactionsDesc() {
    return _isar.transactionModels
        .where()
        .sortByCreatedAtDesc()
        .watch(fireImmediately: true);
  }
}
