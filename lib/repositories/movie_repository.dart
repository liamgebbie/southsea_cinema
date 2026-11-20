import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie>? _cachedMovies;

  List<Movie> getMovies() {
    final List<Movie>? cachedMovies = _cachedMovies;
    if (cachedMovies != null) {
      return cachedMovies;
    }
    return const [
      Movie(
        id: 'goodfellas',
        title: 'GoodFellas',
        synopsis: 'The story of Henry Hill and his life in the mafia.',
        ageRating: '18',
        screeningTime: 'Fri 19:30',
        price: 9.5,
        imagePath: 'assets/images/goodfellas.png',
      ),
      Movie(
        id: 'scarface',
        title: 'Scarface',
        synopsis:
            'A Cuban refugee rises to become a ruthless drug lord in 1980s Miami.',
        ageRating: '18',
        screeningTime: 'Sat 21:00',
        price: 8.0,
        imagePath: 'assets/images/scarface.png',
      ),
    ];
  }

  Movie? getMovieById(String id) {
    for (final movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }
    return null;
  }

  Future<List<Movie>> loadMoviesFromAsset({
    String assetPath = 'assets/data/movies.json',
  }) async {
    final String jsonString = await rootBundle.loadString(assetPath);
    final List<dynamic> jsonList = jsonDecode(jsonString) as List<dynamic>;
    final List<Movie> loadedMovies = [];

    for (final dynamic item in jsonList) {
      loadedMovies.add(Movie.fromJson(item as Map<String, dynamic>));
    }

    _cachedMovies = loadedMovies;
    return loadedMovies;
  }
}