import 'package:isar/isar.dart';

part 'transaction_model.g.dart';

@collection
class TransactionModel {
  Id id = Isar.autoIncrement;

  /// kuruş cinsinden (ör: 350,00₺ => 35000)
  int amountCents;

  /// "Market", "Ulaşım" vb.
  String category;

  /// "Kart", "Nakit", "Banka"
  String wallet;

  /// gelir/ gider (şimdilik gider varsayıyoruz; istersen enum ekleriz)
  @Index()
  bool isIncome;

  /// oluşturulma zamanı
  @Index()
  DateTime createdAt;

  /// opsiyonel not
  String? note;

  TransactionModel({
    required this.amountCents,
    required this.category,
    required this.wallet,
    this.isIncome = false,
    DateTime? createdAt,
    this.note,
  }) : createdAt = createdAt ?? DateTime.now();
}
