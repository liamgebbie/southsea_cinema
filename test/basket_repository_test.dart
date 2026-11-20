import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

const Movie testMovie1 = Movie(
  id: 'film1',
  title: 'Film One',
  synopsis: 'First test film.',
  ageRating: '15',
  screeningTime: 'Mon 18:00',
  price: 10.0,
  imagePath: 'assets/images/goodfellas.png',
);

const Movie testMovie2 = Movie(
  id: 'film2',
  title: 'Film Two',
  synopsis: 'Second test film.',
  ageRating: '12A',
  screeningTime: 'Tue 20:00',
  price: 6.0,
  imagePath: 'assets/images/scarface.png',
);

void main() {
  setUp(() {
    BasketRepository.instance.clear();
  });

  group('BasketRepository', () {
    test('starts empty with zero totals', () {
      final BasketRepository basket = BasketRepository.instance;
      expect(basket.getItems().length, 0);
      expect(basket.getTotalTickets(), 0);
      expect(basket.getTotal(), 0.0);
    });

    test('adds tickets and works out the total', () {
      final BasketRepository basket = BasketRepository.instance;
      basket.addItem(const BasketItem(movie: testMovie1, quantity: 2));
      basket.addItem(const BasketItem(movie: testMovie2, quantity: 1));

      expect(basket.getItems().length, 2);
      expect(basket.getTotalTickets(), 3);
      expect(basket.getTotal(), 26.0);
    });

    test('removes a ticket line', () {
      final BasketRepository basket = BasketRepository.instance;
      basket.addItem(const BasketItem(movie: testMovie1, quantity: 1));
      basket.removeItem(0);

      expect(basket.getItems().length, 0);
      expect(basket.getTotal(), 0.0);
    });

    test('clear empties the basket', () {
      final BasketRepository basket = BasketRepository.instance;
      basket.addItem(const BasketItem(movie: testMovie1, quantity: 3));
      basket.clear();

      expect(basket.getItems(), isEmpty);
    });
  });
}
