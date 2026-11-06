import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie model', () {
    const movie = Movie(
      id: 'test',
      title: 'Test Film',
      synopsis: 'A synopsis',
      ageRating: '15',
      screeningTime: 'Mon 18:00',
      price: 8,
      imagePath: 'assets/images/test.jpg',
    );

    test('constructor assigns properties', () {
      expect(movie.id, 'test');
      expect(movie.title, 'Test Film');
      expect(movie.ageRating, '15');
      expect(movie.screeningTime, 'Mon 18:00');
      expect(movie.price, 8);
      expect(movie.imagePath, 'assets/images/test.jpg');
    });

    test('formattedPrice for whole pounds', () {
      expect(movie.formattedPrice, '£8.00');
    });

    test('formattedPrice with pence', () {
      const pence = Movie(
        id: 'p',
        title: 'P',
        synopsis: 'S',
        ageRating: 'U',
        screeningTime: 'Tue 12:00',
        price: 7.5,
        imagePath: 'assets/images/p.jpg',
      );
      expect(pence.formattedPrice, '£7.50');
    });
  });
}
