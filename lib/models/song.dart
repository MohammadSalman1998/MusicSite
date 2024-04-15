class Song {
  final String title;
  final String type;
  final double price;
  final int artistId;

  Song({
    required this.title,
    required this.type,
    required this.price,
    required this.artistId,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      title: json['Title'] as String,
      type: json['Type'] as String,
      price: json['Price'] as double,
      artistId: json['ID_artist'] as int,
    );
  }
}
