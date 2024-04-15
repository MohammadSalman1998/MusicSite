class Order {
  final int songId;
  final int invoiceId;

  Order({
    required this.songId,
    required this.invoiceId,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      songId: json['ID_song'] as int,
      invoiceId: json['ID_invoice'] as int,
    );
  }
}
