enum TransactionType { topUp, pay, transfer }

class TransactionModel {
  final String? title;
  final DateTime? date;
  final int? value;
  final TransactionType? type;

  TransactionModel({this.title, this.date, this.value, this.type});
}
