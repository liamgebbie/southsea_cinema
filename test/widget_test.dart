import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';

void main() {
  setUp(() {
    rootBundle.clear();
  });

  group('Home page', () {
    testWidgets('shows title, movie cards and booking buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      await tester.pumpAndSettle();

      expect(find.text(appTitle), findsOneWidget);
      expect(find.byType(MovieCard), findsWidgets);
      expect(find.text('GoodFellas (18)'), findsOneWidget);
      expect(find.text('BOOK NOW'), findsWidgets);
    });
  });
}
