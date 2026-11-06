import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group('MovieRepository', () {
    final repository = MovieRepository();

    test('getMovies returns the mock films', () {
      final movies = repository.getMovies();
      expect(movies.length, 2);
      expect(movies[0].title, 'GoodFellas');
      expect(movies[1].title, 'Scarface');
    });

    test('getMovieById finds an existing film', () {
      final movie = repository.getMovieById('goodfellas');
      expect(movie, isNotNull);
      expect(movie!.title, 'GoodFellas');
    });

    test('getMovieById returns null for a missing id', () {
      expect(repository.getMovieById('does-not-exist'), isNull);
    });
  });
}
