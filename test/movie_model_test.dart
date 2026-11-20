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

    test('fromJson reads every field and toJson gives it back', () {
      final Map<String, dynamic> json = {
        'id': 'test',
        'title': 'Test Film',
        'synopsis': 'A synopsis',
        'ageRating': '15',
        'screeningTime': 'Mon 18:00',
        'price': 7.5,
        'imagePath': 'assets/images/test.jpg',
      };

      final Movie movie = Movie.fromJson(json);

      expect(movie.id, 'test');
      expect(movie.title, 'Test Film');
      expect(movie.synopsis, 'A synopsis');
      expect(movie.ageRating, '15');
      expect(movie.screeningTime, 'Mon 18:00');
      expect(movie.price, 7.5);
      expect(movie.imagePath, 'assets/images/test.jpg');
      expect(movie.toJson(), json);
    });

    test('fromJson turns a whole-number price into a double', () {
      final Movie movie = Movie.fromJson({
        'id': 'w',
        'title': 'W',
        'synopsis': 'S',
        'ageRating': 'PG',
        'screeningTime': 'Wed 15:00',
        'price': 8,
        'imagePath': 'assets/images/w.jpg',
      });

      expect(movie.price, isA<double>());
      expect(movie.price, 8.0);
    });
  });
}
