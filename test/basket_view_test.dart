import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/views/basket_view.dart';

const Movie testMovie = Movie(
  id: 'film1',
  title: 'Film One',
  synopsis: 'Test film.',
  ageRating: '15',
  screeningTime: 'Mon 18:00',
  price: 10.0,
  imagePath: 'assets/images/goodfellas.png',
);

void main() {
  setUp(() {
    BasketRepository.instance.clear();
  });

  group('BasketView', () {
    testWidgets('shows empty message when basket is empty',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: BasketView()));

      expect(find.text('Your basket is empty'), findsOneWidget);
      expect(find.text('Checkout'), findsNothing);
    });

    testWidgets('shows tickets and removes them', (WidgetTester tester) async {
      BasketRepository.instance
          .addItem(const BasketItem(movie: testMovie, quantity: 2));

      await tester.pumpWidget(const MaterialApp(home: BasketView()));

      expect(find.text('2 x Film One £20.00'), findsOneWidget);
      expect(find.text('Total: £20.00'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.delete_outline));
      await tester.pump();

      expect(find.text('Your basket is empty'), findsOneWidget);
    });

    testWidgets('checkout clears the basket', (WidgetTester tester) async {
      BasketRepository.instance
          .addItem(const BasketItem(movie: testMovie, quantity: 1));

      await tester.pumpWidget(const MaterialApp(home: BasketView()));
      await tester.tap(find.text('Checkout'));
      await tester.pump();

      expect(find.text('Thanks, your tickets are booked'), findsOneWidget);
      expect(BasketRepository.instance.getItems(), isEmpty);
    });
  });
}