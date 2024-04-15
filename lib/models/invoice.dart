class Invoice {
  final int customerId;
  final DateTime date;
  final double total;
  final String creditCard;

  Invoice({
    required this.customerId,
    required this.date,
    required this.total,
    required this.creditCard,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      customerId: json['ID_customer'] as int,
      date: DateTime.parse(json['Date'] as String),
      total: json['Total'] as double,
      creditCard: json['CreditCard'] as String,
    );
  }
}
