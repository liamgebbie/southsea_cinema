import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
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
        synopsis: 'A Cuban refugee rises to become a ruthless drug lord in 1980s Miami.',
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
}