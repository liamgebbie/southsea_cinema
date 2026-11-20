class Movie {
  final String id;
  final String title;
  final String synopsis;
  final String ageRating;
  final String screeningTime;
  final double price;
  final String imagePath;

  const Movie({
    required this.id,
    required this.title,
    required this.synopsis,
    required this.ageRating,
    required this.screeningTime,
    required this.price,
    required this.imagePath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    final num priceNumber = json['price'] as num;
    return Movie(
      id: json['id'] as String,
      title: json['title'] as String,
      synopsis: json['synopsis'] as String,
      ageRating: json['ageRating'] as String,
      screeningTime: json['screeningTime'] as String,
      price: priceNumber.toDouble(),
      imagePath: json['imagePath'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'synopsis': synopsis,
      'ageRating': ageRating,
      'screeningTime': screeningTime,
      'price': price,
      'imagePath': imagePath,
    };
  }

  String get formattedPrice => '£${price.toStringAsFixed(2)}';
}