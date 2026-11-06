import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/views/movie_listing.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cinemaSurface,
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(movie.imagePath, width: 100, fit: BoxFit.cover),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${movie.title} (${movie.ageRating})',
                      style: cinemaHeaderStyle),
                  const SizedBox(height: 4),
                  Text(movie.synopsis,
                      style: const TextStyle(color: cinemaFontMuted)),
                  const SizedBox(height: 4),
                  Text(movie.screeningTime,
                      style: const TextStyle(color: cinemaFontWhite)),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: cinemaBrand,
                      foregroundColor: cinemaBackground,
                      shape: const RoundedRectangleBorder(),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieListing(movie: movie),
                        ),
                      );
                    },
                    child: const Text('BOOK NOW'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
